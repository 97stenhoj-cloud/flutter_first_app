// Import required modules
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import Anthropic from 'https://esm.sh/@anthropic-ai/sdk@0.20.1'

// Allowed origins for CORS
const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

interface GenerationPrompts {
  occasion: string
  group_size: number // 2-10 people
  num_cards: number // how many cards to create
  energy: number // 1-5 (vibe/intensity)
  depth: number // 1-5 (how personal/serious)
  spice: number // 1-4 (how edgy/cheeky)
  remarks?: string
}

interface GenerateQuestionsRequest {
  generation_prompts: GenerationPrompts
  batch_number?: number
}

interface Question {
  question: string
  answer: string
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Get the authorization header
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      throw new Error('No authorization header')
    }

    // Initialize Supabase client with the auth token
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: authHeader },
        },
      }
    )

    // Check if user is authenticated
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      throw new Error('Unauthorized')
    }

    // Check if user is premium
    const { data: subscriptionData, error: subError } = await supabase
      .from('user_subscriptions')
      .select('is_premium')
      .eq('user_id', user.id)
      .single()

    if (subError || !subscriptionData?.is_premium) {
      throw new Error('Premium subscription required')
    }

    // Parse request body
    const { generation_prompts, batch_number = 1 }: GenerateQuestionsRequest = await req.json()

    // Validate required fields
    // Note: num_cards is optional - we always generate 10 cards per batch
    if (!generation_prompts?.occasion || generation_prompts?.energy === undefined ||
        generation_prompts?.depth === undefined || generation_prompts?.spice === undefined ||
        !generation_prompts?.group_size) {
      throw new Error('Missing required generation prompts')
    }

    // Get Anthropic API key from environment
    const anthropicApiKey = Deno.env.get('ANTHROPIC_API_KEY')
    if (!anthropicApiKey) {
      throw new Error('Anthropic API key not configured')
    }

    // Initialize Anthropic client
    const anthropic = new Anthropic({
      apiKey: anthropicApiKey,
    })

    // Energy level descriptions
    const energyDesc = generation_prompts.energy === 1 ? 'super chill, calm, low-key, gentle pace' :
                      generation_prompts.energy === 2 ? 'relaxed, easy-going' :
                      generation_prompts.energy === 3 ? 'balanced, normal social energy' :
                      generation_prompts.energy === 4 ? 'high-energy, lively, lots of laughter' :
                      'chaotic, wild party vibe, fast-paced'

    // Depth level descriptions
    const depthDesc = generation_prompts.depth === 1 ? 'light, surface-level, no real vulnerability' :
                     generation_prompts.depth === 2 ? 'slightly personal but still safe for new groups' :
                     generation_prompts.depth === 3 ? 'mixed light and real, some authentic sharing' :
                     generation_prompts.depth === 4 ? 'quite personal, emotions, values, real stories' :
                     'very deep, vulnerable, introspective'

    // Spice level descriptions
    const spiceDesc = generation_prompts.spice === 1 ? 'wholesome, family-friendly, no innuendo' :
                     generation_prompts.spice === 2 ? 'slightly cheeky, playful but still safe' :
                     generation_prompts.spice === 3 ? 'real talk, mature topics, honest and direct' :
                     'spicy and bold, teasing and flirty but NOT explicit'

    // Build the system prompt
    // NOTE: We generate 11 cards but only show 10 to the user
    // The 11th card ensures the dialog appears after the user swipes the 10th card
    const systemPrompt = `You are a card game designer creating conversation starter cards for social gatherings.

IMPORTANT: Return ONLY a valid JSON array with exactly 11 unique cards. No additional text, markdown, or explanation.

Each card object must have:
- "question": The card text (ONE or TWO sentences max, understandable on its own)
- "answer": Brief guidance or discussion points (1-2 sentences)

Card formats you can mix:
- "question" (ask something)
- "challenge" (do something fun)
- "mini_game" (quick group activity)

CRITICAL RULES:
- Stay safe: NO explicit sexual content, hate, harassment, self-harm
- Make cards playable by the whole group of ${generation_prompts.group_size} people
- Each card must work standalone (no references to "previous card")
- Varied topics and styles across all cards`

    // Build the user prompt based on parameters
    const userPrompt = `Create exactly 11 cards for BATCH #${batch_number}.

OCCASION: ${generation_prompts.occasion || 'general social gathering'}
GROUP SIZE: ${generation_prompts.group_size} people
${generation_prompts.remarks ? `SPECIAL REQUIREMENTS: ${generation_prompts.remarks}` : ''}

ENERGY (${generation_prompts.energy}/5): ${energyDesc}
→ Match this pacing and intensity in your card designs

DEPTH (${generation_prompts.depth}/5): ${depthDesc}
→ Match this vulnerability level in the topics you choose

SPICE (${generation_prompts.spice}/4): ${spiceDesc}
→ Match this edginess/cheekiness in tone and content

BATCH ${batch_number} VARIETY:
${batch_number > 1 ? '- Create COMPLETELY different cards from previous batches' : '- Maximize variety across all cards'}
- Mix formats: questions, challenges, mini-games
- Diverse topics: experiences, opinions, hypotheticals, preferences, stories, values, creativity, emotions
- Different question styles and structures

CONSTRAINTS:
- Combine occasion + sliders + remarks to decide tone
- Make cards work for ${generation_prompts.group_size} people (unless remarks specify otherwise)
- Use remarks as hard constraints (e.g., "team building", "no drinking", "for couples")
- Stay within content safety rules

Return ONLY the JSON array with 11 cards, no other text.`

    // Call Anthropic API
    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-20250514',
      max_tokens: 3000, // Sufficient for 10 cards with detailed answers
      temperature: 0.9, // Higher temperature for more variety
      system: systemPrompt,
      messages: [
        {
          role: 'user',
          content: userPrompt,
        },
      ],
    })

    // Extract the content from the response
    const content = response.content[0]
    if (content.type !== 'text') {
      throw new Error('Unexpected response format from AI')
    }

    // Parse the JSON response
    let questions: Question[]
    try {
      // Clean the response in case it has markdown code blocks
      const cleanedContent = content.text
        .replace(/```json\n?/g, '')
        .replace(/```\n?/g, '')
        .trim()

      questions = JSON.parse(cleanedContent)

      // Validate the response structure
      if (!Array.isArray(questions) || questions.length !== 11) {
        throw new Error('Invalid response format: expected array of 11 questions')
      }

      // Validate each question object
      questions.forEach((q, index) => {
        if (!q.question || typeof q.question !== 'string') {
          throw new Error(`Invalid question at index ${index}: missing or invalid question field`)
        }
        if (!q.answer || typeof q.answer !== 'string') {
          throw new Error(`Invalid question at index ${index}: missing or invalid answer field`)
        }
      })
    } catch (parseError) {
      console.error('Failed to parse AI response:', content.text)
      throw new Error(`Failed to parse AI response: ${parseError.message}`)
    }

    // Log successful generation for analytics (don't fail if logging fails)
    try {
      await supabase.from('ai_generation_logs').insert({
        user_id: user.id,
        generation_prompts,
        batch_number,
        questions_generated: questions.length,
        status: 'success',
      })
    } catch (logError) {
      console.error('Failed to log generation:', logError)
    }

    // Return the questions
    return new Response(
      JSON.stringify({
        questions,
        batch_number,
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    )

  } catch (error) {
    console.error('Error in generate-ai-questions:', error)

    // Determine appropriate error message and status
    let statusCode = 500
    let errorMessage = 'Internal server error'

    if (error.message === 'Unauthorized') {
      statusCode = 401
      errorMessage = 'Authentication required'
    } else if (error.message === 'Premium subscription required') {
      statusCode = 403
      errorMessage = 'Premium subscription required to generate AI questions'
    } else if (error.message.includes('Missing required')) {
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