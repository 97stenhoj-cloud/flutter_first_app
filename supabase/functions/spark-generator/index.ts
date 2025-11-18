// Spark Mode AI Question Generator Edge Function
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import Anthropic from 'https://esm.sh/@anthropic-ai/sdk@0.20.1'

// CORS headers
const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

interface SparkGenerationParams {
  question_count: number // 5, 10, 15, 20, or 25
  energy: number // 1-5
  depth: number // 1-5
  spice: number // 1-4
  group_size: number
  occasion: string
  additional_prompt?: string // Optional user-provided additional instructions
}

interface Question {
  question: string
  answer?: string
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Get authorization header
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      throw new Error('No authorization header')
    }

    // Initialize Supabase client
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: authHeader },
        },
      }
    )

    // Check authentication
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      throw new Error('Unauthorized')
    }

    // Check subscription tier and Spark access
    const { data: subscriptionData, error: subError } = await supabase
      .from('user_subscriptions')
      .select('subscription_tier')
      .eq('user_id', user.id)
      .single()

    if (subError || !subscriptionData) {
      throw new Error('Subscription not found')
    }

    const tier = subscriptionData.subscription_tier
    if (tier !== 'premium' && tier !== 'premium_plus') {
      throw new Error('Spark mode requires Premium or Premium+ subscription')
    }

    // Parse request body
    const params: SparkGenerationParams = await req.json()

    // Validate parameters
    if (!params.question_count || ![5, 10, 15, 20, 25].includes(params.question_count)) {
      throw new Error('Invalid question_count. Must be 5, 10, 15, 20, or 25')
    }

    if (!params.occasion || !params.occasion.trim()) {
      throw new Error('Occasion is required')
    }

    if (params.energy < 1 || params.energy > 5) {
      throw new Error('Energy must be between 1 and 5')
    }

    if (params.depth < 1 || params.depth > 5) {
      throw new Error('Depth must be between 1 and 5')
    }

    if (params.spice < 1 || params.spice > 4) {
      throw new Error('Spice must be between 1 and 4')
    }

    if (params.group_size < 1 || params.group_size > 20) {
      throw new Error('Group size must be between 1 and 20')
    }

    // Check Spark usage limit
    const { data: remaining } = await supabase
      .rpc('get_spark_remaining', { p_user_id: user.id })

    if (remaining === null || remaining < params.question_count) {
      throw new Error(`Insufficient Spark questions remaining. You have ${remaining || 0} questions left, but requested ${params.question_count}.`)
    }

    // Get Anthropic API key
    const anthropicApiKey = Deno.env.get('ANTHROPIC_API_KEY')
    if (!anthropicApiKey) {
      throw new Error('Anthropic API key not configured')
    }

    // Initialize Anthropic client
    const anthropic = new Anthropic({
      apiKey: anthropicApiKey,
    })

    // Energy level descriptions
    const energyDesc = params.energy === 1 ? 'super chill, calm, low-key, gentle pace' :
                      params.energy === 2 ? 'relaxed, easy-going' :
                      params.energy === 3 ? 'balanced, normal social energy' :
                      params.energy === 4 ? 'high-energy, lively, lots of laughter' :
                      'chaotic, wild party vibe, fast-paced'

    // Depth level descriptions
    const depthDesc = params.depth === 1 ? 'light, surface-level, no real vulnerability' :
                     params.depth === 2 ? 'slightly personal but still safe for new groups' :
                     params.depth === 3 ? 'mixed light and real, some authentic sharing' :
                     params.depth === 4 ? 'quite personal, emotions, values, real stories' :
                     'very deep, vulnerable, introspective'

    // Spice level descriptions
    const spiceDesc = params.spice === 1 ? 'wholesome, family-friendly, no innuendo' :
                     params.spice === 2 ? 'slightly cheeky, playful but still safe' :
                     params.spice === 3 ? 'real talk, mature topics, honest and direct' :
                     'spicy and bold, teasing and flirty but NOT explicit'

    // Build the system prompt
    const systemPrompt = `You are an expert conversation starter designer for Spark Mode, a premium AI-powered feature.

IMPORTANT: Return ONLY a valid JSON array with exactly ${params.question_count} unique, high-quality conversation starters. No additional text, markdown, or explanation.

Each object must have:
- "question": The conversation starter (1-2 sentences max, clear and standalone)
- "answer": Optional brief guidance or discussion points (1-2 sentences)

CRITICAL RULES:
- ONLY create conversation questions - NO challenges, NO activities, NO games, NO "do this" prompts
- Each question must be about TALKING, SHARING, or DISCUSSING
- Ask ONE clear question per card - NEVER combine multiple questions in one
- Questions should spark dialogue and storytelling
- Stay safe: NO explicit sexual content, hate, harassment, self-harm
- Make questions engaging and suitable for ${params.group_size} people
- Each question must work standalone
- Maximize variety across all questions
- High quality only - these are premium AI-generated questions

Good examples:
- "What's a moment when you felt truly proud of yourself?"
- "If you could have dinner with anyone, living or dead, who would it be and why?"
- "What's something you believed as a child that you later found out wasn't true?"

Bad examples (DO NOT CREATE THESE):
- "Share a story AND then do a group activity" (combines question + challenge)
- "What's your favorite food? And what's your dream vacation?" (two questions in one)
- "Everyone stand up and share..." (this is a challenge, not just a question)
- "Take turns doing..." (this is an activity, not a conversation starter)`

    // Build the user prompt
    const userPrompt = `Create exactly ${params.question_count} conversation starters.

OCCASION: ${params.occasion}
GROUP SIZE: ${params.group_size} people
${params.additional_prompt ? `\nADDITIONAL INSTRUCTIONS: ${params.additional_prompt}` : ''}

ENERGY (${params.energy}/5): ${energyDesc}
→ Match this pacing and intensity

DEPTH (${params.depth}/5): ${depthDesc}
→ Match this vulnerability level

SPICE (${params.spice}/4): ${spiceDesc}
→ Match this edginess/tone

REMEMBER: ONLY CREATE QUESTIONS FOR CONVERSATION AND DISCUSSION
- NO "do this" challenges or activities
- NO "everyone stand/sit/move" instructions
- NO combining multiple questions in one
- ONLY questions that spark talking, sharing, and dialogue

VARIETY REQUIREMENTS:
- Mix different question styles: open-ended, hypothetical, reflective, opinion-based, storytelling
- Diverse topics: experiences, opinions, hypotheticals, preferences, stories, values, creativity, emotions, memories
- Different depths and angles on the chosen topics
- Make each question feel fresh and unique

CONSTRAINTS:
- Combine occasion + sliders${params.additional_prompt ? ' + additional instructions' : ''} to decide overall tone
- Questions must work for ${params.group_size} people
- Stay within content safety guidelines
- Premium quality expected - these are paid questions

Return ONLY the JSON array with ${params.question_count} questions, no other text.`

    console.log(`Generating ${params.question_count} Spark questions for user ${user.id}`)

    // Call Anthropic API
    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-20250514',
      max_tokens: 4000,
      temperature: 0.9, // High temperature for creativity
      system: systemPrompt,
      messages: [
        {
          role: 'user',
          content: userPrompt,
        },
      ],
    })

    // Extract content
    const content = response.content[0]
    if (content.type !== 'text') {
      throw new Error('Unexpected response format from AI')
    }

    // Parse JSON response
    let questions: Question[]
    try {
      const cleanedContent = content.text
        .replace(/```json\n?/g, '')
        .replace(/```\n?/g, '')
        .trim()

      questions = JSON.parse(cleanedContent)

      // Validate response
      if (!Array.isArray(questions) || questions.length !== params.question_count) {
        throw new Error(`Invalid response format: expected array of ${params.question_count} questions, got ${questions?.length || 0}`)
      }

      // Validate each question
      questions.forEach((q, index) => {
        if (!q.question || typeof q.question !== 'string' || q.question.trim().length === 0) {
          throw new Error(`Invalid question at index ${index}: missing or empty question field`)
        }
      })
    } catch (parseError) {
      console.error('Failed to parse AI response:', content.text)
      throw new Error(`Failed to parse AI response: ${parseError.message}`)
    }

    console.log(`Successfully generated ${questions.length} questions`)

    // Return the questions
    return new Response(
      JSON.stringify({ questions }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    )

  } catch (error) {
    console.error('Error in spark-generator:', error)

    let statusCode = 500
    let errorMessage = 'Internal server error'

    if (error.message === 'Unauthorized') {
      statusCode = 401
      errorMessage = 'Authentication required'
    } else if (error.message.includes('Spark mode requires')) {
      statusCode = 403
      errorMessage = error.message
    } else if (error.message.includes('Insufficient Spark')) {
      statusCode = 403
      errorMessage = error.message
    } else if (error.message.includes('Invalid') || error.message.includes('required')) {
      statusCode = 400
      errorMessage = error.message
    }

    return new Response(
      JSON.stringify({
        error: errorMessage,
        details: error.message
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: statusCode,
      }
    )
  }
})
