import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const REVENUECAT_WEBHOOK_SECRET = Deno.env.get('REVENUECAT_WEBHOOK_SECRET')

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, x-revenuecat-secret',
}

// Map RevenueCat product IDs to subscription tiers
const PRODUCT_TIER_MAP: Record<string, string> = {
  // Test Store products (all monthly billing, different price tiers)
  // Note: Product names are Test Store labels - all are monthly subscriptions
  'monthly': 'basic',        // Basic Monthly (lowest price)
  'yearly': 'premium',       // Premium Monthly (medium price)
  'lifetime': 'premium_plus', // Premium+ Monthly (highest price)

  // Production products (for future use)
  'basic_monthly': 'basic',
  'premium_monthly': 'premium',
  'premium_plus_monthly': 'premium_plus',
  'basic_yearly': 'basic',
  'premium_yearly': 'premium',
  'premium_plus_yearly': 'premium_plus',
}

interface RevenueCatEvent {
  type: string
  app_user_id: string
  product_id: string
  period_type?: string
  purchased_at_ms?: number
  expiration_at_ms?: number
  store?: string
  environment?: string
  auto_renew_status?: boolean
  is_trial_period?: boolean
}

interface RevenueCatWebhookPayload {
  event: RevenueCatEvent
  subscriber?: {
    original_app_user_id: string
    entitlements?: Record<string, any>
  }
}

// RevenueCat webhook IP addresses (for IP whitelisting)
// Source: https://www.revenuecat.com/docs/webhooks#ip-addresses
const REVENUECAT_IPS = [
  '44.235.248.192',
  '44.236.49.208',
  '52.89.214.96',
  '54.68.10.61',
]

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Security Layer 1: IP Whitelisting (Production)
    // Verify request comes from RevenueCat's servers
    const clientIp = req.headers.get('x-forwarded-for')?.split(',')[0].trim() ||
                     req.headers.get('cf-connecting-ip') ||
                     'unknown'

    const isRevenueCatIp = REVENUECAT_IPS.includes(clientIp)

    if (!isRevenueCatIp) {
      console.warn(`⚠️ Request from non-RevenueCat IP: ${clientIp}`)
      // For sandbox/testing, log but don't block
      // For production, uncomment the next block to enforce IP whitelisting:
      /*
      return new Response(
        JSON.stringify({ error: 'Unauthorized - Invalid source IP' }),
        {
          status: 403,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        }
      )
      */
    } else {
      console.log(`✅ Request from verified RevenueCat IP: ${clientIp}`)
    }

    // Security Layer 2: Custom webhook secret (if provided)
    const secretHeader = req.headers.get('X-RevenueCat-Secret')
    if (REVENUECAT_WEBHOOK_SECRET && secretHeader) {
      if (secretHeader !== REVENUECAT_WEBHOOK_SECRET) {
        console.error('❌ Invalid webhook secret')
        console.error('Expected:', REVENUECAT_WEBHOOK_SECRET)
        console.error('Received:', secretHeader)
        return new Response(
          JSON.stringify({ error: 'Unauthorized - Invalid webhook secret' }),
          {
            status: 401,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
          }
        )
      }
      console.log('✅ Webhook secret verified')
    } else {
      console.log('ℹ️ No custom secret header provided (RevenueCat limitation)')
    }

    const payload: RevenueCatWebhookPayload = await req.json()
    console.log('📥 Received webhook:', JSON.stringify(payload, null, 2))

    const event = payload.event
    const eventType = event.type
    const appUserId = event.app_user_id
    const productId = event.product_id
    const store = event.store === 'APP_STORE' ? 'app_store' : 'play_store'

    // Validate required fields
    if (!appUserId) {
      console.error('❌ Missing app_user_id in webhook payload')
      return new Response(
        JSON.stringify({ error: 'Missing app_user_id' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        }
      )
    }

    // Get subscriber info
    const subscriber = payload.subscriber
    const revenuecatSubscriptionId = subscriber?.original_app_user_id || appUserId

    // Determine subscription tier from product ID
    const subscriptionTier = PRODUCT_TIER_MAP[productId] || 'free'
    const isPremium = subscriptionTier !== 'free'

    // Create Supabase client with service role (bypass RLS)
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // Get current subscription state for history
    const { data: currentSub } = await supabase
      .from('user_subscriptions')
      .select('subscription_tier')
      .eq('user_id', appUserId)
      .single()

    const oldTier = currentSub?.subscription_tier || 'free'

    // Handle different event types
    switch (eventType) {
      case 'INITIAL_PURCHASE':
      case 'RENEWAL':
      case 'PRODUCT_CHANGE':
      case 'NON_RENEWING_PURCHASE':  // One-time purchases (like lifetime)
        console.log(`✅ Processing ${eventType} for user ${appUserId}`)

        // Active subscription - update user
        const expirationDate = event.expiration_at_ms
          ? new Date(event.expiration_at_ms)
          : new Date(Date.now() + 30 * 24 * 60 * 60 * 1000) // Default 30 days

        const { error: updateError } = await supabase
          .from('user_subscriptions')
          .upsert({
            user_id: appUserId,
            is_premium: isPremium,
            subscription_tier: subscriptionTier,
            revenuecat_subscription_id: revenuecatSubscriptionId,
            product_id: productId,
            store: store,
            expiration_date: expirationDate.toISOString(),
            auto_renew_status: event.auto_renew_status ?? true,
            is_trial_period: event.is_trial_period ?? false,
            cancellation_date: null, // Clear any previous cancellation
            last_webhook_event: eventType,
            last_webhook_timestamp: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          }, { onConflict: 'user_id' })

        if (updateError) {
          console.error('❌ Error updating subscription:', updateError)
          throw updateError
        }

        // Log to history
        await supabase.from('subscription_history').insert({
          user_id: appUserId,
          event_type: eventType,
          old_tier: oldTier,
          new_tier: subscriptionTier,
          product_id: productId,
          store: store,
          revenuecat_data: payload,
        })

        console.log(`✅ Subscription updated for user ${appUserId}: ${oldTier} → ${subscriptionTier}`)
        break

      case 'CANCELLATION':
        console.log(`🚫 Processing CANCELLATION for user ${appUserId}`)

        // User cancelled - mark but don't downgrade until expiration
        const { error: cancelError } = await supabase
          .from('user_subscriptions')
          .update({
            auto_renew_status: false,
            cancellation_date: new Date().toISOString(),
            last_webhook_event: eventType,
            last_webhook_timestamp: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          })
          .eq('user_id', appUserId)

        if (cancelError) {
          console.error('❌ Error marking cancellation:', cancelError)
          throw cancelError
        }

        // Log to history
        await supabase.from('subscription_history').insert({
          user_id: appUserId,
          event_type: eventType,
          old_tier: oldTier,
          new_tier: oldTier, // Tier doesn't change immediately
          product_id: productId,
          store: store,
          revenuecat_data: payload,
        })

        console.log(`🚫 Subscription cancelled for user ${appUserId} (remains active until expiration)`)
        break

      case 'EXPIRATION':
      case 'BILLING_ISSUE':
        console.log(`⬇️ Processing ${eventType} for user ${appUserId}`)

        // Downgrade to free tier
        const { error: expireError } = await supabase
          .from('user_subscriptions')
          .update({
            is_premium: false,
            subscription_tier: 'free',
            auto_renew_status: false,
            last_webhook_event: eventType,
            last_webhook_timestamp: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          })
          .eq('user_id', appUserId)

        if (expireError) {
          console.error('❌ Error handling expiration:', expireError)
          throw expireError
        }

        // Log to history
        await supabase.from('subscription_history').insert({
          user_id: appUserId,
          event_type: eventType,
          old_tier: oldTier,
          new_tier: 'free',
          product_id: productId,
          store: store,
          revenuecat_data: payload,
        })

        console.log(`⬇️ User ${appUserId} downgraded to free tier (${eventType})`)
        break

      case 'REFUND':
        console.log(`💰 Processing REFUND for user ${appUserId}`)

        // Immediate downgrade on refund
        const { error: refundError } = await supabase
          .from('user_subscriptions')
          .update({
            is_premium: false,
            subscription_tier: 'free',
            auto_renew_status: false,
            last_webhook_event: eventType,
            last_webhook_timestamp: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          })
          .eq('user_id', appUserId)

        if (refundError) {
          console.error('❌ Error handling refund:', refundError)
          throw refundError
        }

        // Log to history
        await supabase.from('subscription_history').insert({
          user_id: appUserId,
          event_type: eventType,
          old_tier: oldTier,
          new_tier: 'free',
          product_id: productId,
          store: store,
          revenuecat_data: payload,
        })

        console.log(`💰 Refund processed for user ${appUserId}, downgraded to free`)
        break

      default:
        console.log(`ℹ️ Unhandled event type: ${eventType}`)

        // Log unknown events to history for debugging
        await supabase.from('subscription_history').insert({
          user_id: appUserId,
          event_type: eventType,
          old_tier: oldTier,
          new_tier: oldTier,
          product_id: productId,
          store: store,
          revenuecat_data: payload,
        })
    }

    return new Response(
      JSON.stringify({
        received: true,
        event_type: eventType,
        user_id: appUserId,
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    )

  } catch (error) {
    console.error('❌ Webhook error:', error)
    return new Response(
      JSON.stringify({
        error: error.message || 'Internal server error',
        details: error.toString()
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 500,
      }
    )
  }
})
