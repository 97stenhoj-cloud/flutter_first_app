# 🔧 Fix Webhook 401 Error

## Problem

The webhook returns:
```json
{"code":401,"message":"Invalid JWT"}
```

This happens because Supabase Edge Functions expect a JWT token by default, but RevenueCat sends a custom Bearer token.

---

## Solution: Update RevenueCat Webhook Configuration

The issue is that RevenueCat needs to send the **anon key** in the `apikey` header for Supabase to accept the request, then our custom authorization header for verification.

### Option 1: Use Custom Authorization Header (Recommended)

RevenueCat allows custom headers. Here's the correct configuration:

**RevenueCat Dashboard → Integrations → Webhooks**

**URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Headers:**

1. **Authorization Header:**
   - Key: `Authorization`
   - Value: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8`

   (This is your Supabase anon key from the .env file)

2. **Custom Verification Header:**
   - Key: `X-RevenueCat-Secret`
   - Value: `RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`

**Events:** Select ALL

---

## Update the Edge Function

We need to modify the webhook function to check the custom header instead of Authorization.

### Updated Webhook Code

Replace the authorization check in [`supabase/functions/revenuecat-webhook/index.ts`](supabase/functions/revenuecat-webhook/index.ts):

**Find this (lines 52-65):**
```typescript
// Verify webhook secret if configured
if (REVENUECAT_WEBHOOK_SECRET) {
  const authHeader = req.headers.get('Authorization')
  if (authHeader !== `Bearer ${REVENUECAT_WEBHOOK_SECRET}`) {
    console.error('❌ Invalid webhook secret')
    return new Response(
      JSON.stringify({ error: 'Unauthorized' }),
      {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      }
    )
  }
}
```

**Replace with:**
```typescript
// Verify webhook secret if configured
if (REVENUECAT_WEBHOOK_SECRET) {
  const secretHeader = req.headers.get('X-RevenueCat-Secret')
  if (secretHeader !== REVENUECAT_WEBHOOK_SECRET) {
    console.error('❌ Invalid webhook secret')
    console.error('Expected:', REVENUECAT_WEBHOOK_SECRET)
    console.error('Received:', secretHeader)
    return new Response(
      JSON.stringify({ error: 'Unauthorized' }),
      {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      }
    )
  }
}
```

---

## Option 2: Simpler - No Authentication (For Testing)

If you just want to test quickly, you can temporarily disable authentication:

### Temporarily Disable Auth Check

Comment out the authentication in the webhook:

```typescript
// Verify webhook secret if configured
// TEMPORARILY DISABLED FOR TESTING
/*
if (REVENUECAT_WEBHOOK_SECRET) {
  const authHeader = req.headers.get('Authorization')
  if (authHeader !== `Bearer ${REVENUECAT_WEBHOOK_SECRET}`) {
    console.error('❌ Invalid webhook secret')
    return new Response(
      JSON.stringify({ error: 'Unauthorized' }),
      {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }
      }
    )
  }
}
*/
console.log('⚠️ WARNING: Webhook authentication is disabled!')
```

**RevenueCat Configuration:**
- URL: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
- Authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8`

This will allow the webhook through Supabase's JWT check, and skip our custom verification.

**⚠️ Remember to re-enable authentication before production!**

---

## Step-by-Step Fix (Recommended Option 1)

### Step 1: Update the Webhook Function

```bash
cd /Users/stenhoej/Desktop/flutter_first_app
```

Edit [`supabase/functions/revenuecat-webhook/index.ts`](supabase/functions/revenuecat-webhook/index.ts) and replace the authorization check as shown above.

### Step 2: Deploy Updated Function

```bash
npx supabase functions deploy revenuecat-webhook
```

### Step 3: Update RevenueCat Webhook

**RevenueCat Dashboard:**

1. Delete the old webhook (or edit it)
2. Create new webhook with:
   - URL: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`

3. Add headers:
   - **Authorization**: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8`
   - **X-RevenueCat-Secret**: `RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`

4. Select all events
5. Save

### Step 4: Test

Send test event from RevenueCat Dashboard.

**Expected:** ✅ **200 OK**

---

## Why This Happens

Supabase Edge Functions are protected by JWT authentication by default. When RevenueCat sends a webhook:

1. **Without proper JWT**: Supabase returns 401 before function runs
2. **With anon key**: Supabase allows the request through
3. **Custom header check**: Our function verifies it's from RevenueCat

This two-layer approach ensures:
- ✅ Supabase validates the request is authorized
- ✅ Our function validates it's actually from RevenueCat
- ✅ Secure and properly authenticated

---

## Quick Test After Fix

```bash
# Send test event from RevenueCat Dashboard
# Should return: 200 OK

# Check Supabase logs:
# Should see: ✅ Webhook event received: INITIAL_PURCHASE
```

---

## Alternative: Use Supabase Service Role URL

Another option is to use the service role key directly in the URL (less secure, but simpler for testing):

**Don't use this in production!** But for testing:

```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook?apikey=YOUR_SERVICE_ROLE_KEY
```

This bypasses JWT completely. Only use for quick testing!

---

Let me know which option you'd like to proceed with! Option 1 (custom header) is the most secure and production-ready.
