// Edge Function to check and process expired subscriptions
// This provides redundancy in case RevenueCat webhooks fail
// Should be scheduled to run daily via Supabase cron jobs

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.7.1';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    console.log('🕐 Starting subscription expiration check...');

    // Initialize Supabase client
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false,
        },
      }
    );

    // Find all subscriptions that are expired but still marked as premium
    const { data: expiredSubscriptions, error: fetchError } = await supabaseClient
      .from('user_subscriptions')
      .select('user_id, subscription_tier, expiration_date, is_premium')
      .eq('is_premium', true)
      .lt('expiration_date', new Date().toISOString());

    if (fetchError) {
      console.error('❌ Error fetching expired subscriptions:', fetchError);
      throw fetchError;
    }

    if (!expiredSubscriptions || expiredSubscriptions.length === 0) {
      console.log('✅ No expired subscriptions found');
      return new Response(
        JSON.stringify({
          success: true,
          message: 'No expired subscriptions to process',
          processed: 0,
        }),
        {
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          status: 200,
        }
      );
    }

    console.log(`⚠️ Found ${expiredSubscriptions.length} expired subscriptions to process`);

    // Process each expired subscription
    const results = [];
    for (const subscription of expiredSubscriptions) {
      try {
        console.log(`🔄 Processing expired subscription for user: ${subscription.user_id}`);
        console.log(`   Previous tier: ${subscription.subscription_tier}`);
        console.log(`   Expiration date: ${subscription.expiration_date}`);

        // Downgrade to free tier
        const { error: updateError } = await supabaseClient
          .from('user_subscriptions')
          .update({
            is_premium: false,
            subscription_tier: 'free',
            updated_at: new Date().toISOString(),
            last_webhook_event: 'EXPIRATION_JOB',
            last_webhook_timestamp: new Date().toISOString(),
          })
          .eq('user_id', subscription.user_id);

        if (updateError) {
          console.error(`❌ Error updating subscription for user ${subscription.user_id}:`, updateError);
          results.push({
            user_id: subscription.user_id,
            success: false,
            error: updateError.message,
          });
        } else {
          console.log(`✅ Downgraded user ${subscription.user_id} to free tier`);
          results.push({
            user_id: subscription.user_id,
            success: true,
            previous_tier: subscription.subscription_tier,
            expiration_date: subscription.expiration_date,
          });
        }
      } catch (error) {
        console.error(`❌ Error processing user ${subscription.user_id}:`, error);
        results.push({
          user_id: subscription.user_id,
          success: false,
          error: error.message,
        });
      }
    }

    const successCount = results.filter((r) => r.success).length;
    const failureCount = results.filter((r) => !r.success).length;

    console.log(`✅ Expiration check complete: ${successCount} processed, ${failureCount} failed`);

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Subscription expiration check completed',
        processed: successCount,
        failed: failureCount,
        details: results,
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    );
  } catch (error) {
    console.error('❌ Error in expiration check:', error);
    return new Response(
      JSON.stringify({
        success: false,
        error: error.message,
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 500,
      }
    );
  }
});
