# 🚀 Deploy Webhook Without JWT Verification

## Problem

Supabase Edge Functions require JWT authentication by default, but RevenueCat can't send a valid JWT token.

## Solution

I've created a configuration file that disables JWT verification for the webhook function.

---

## What I Did

Created: `supabase/functions/revenuecat-webhook/.well-known/config.json`

```json
{
  "verify_jwt": false
}
```

This tells Supabase to skip JWT validation for this specific function.

---

## Deploy the Function

Run this command to deploy with the new configuration:

```bash
cd /Users/stenhoej/Desktop/flutter_first_app
npx supabase functions deploy revenuecat-webhook --no-verify-jwt
```

**OR** if you're logged in to Supabase CLI:

```bash
supabase functions deploy revenuecat-webhook --no-verify-jwt
```

---

## After Deployment

### Configure RevenueCat Webhook

Go to [RevenueCat Dashboard → Integrations → Webhooks](https://app.revenuecat.com/settings/integrations)

**URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Authorization Header:**
```
Bearer RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=
```
*(This is now our custom webhook secret, not a JWT token)*

**Events:** Select **ALL**

**Save!**

---

## How It Works Now

### Before (Broken):
```
RevenueCat sends webhook
    ↓
Supabase checks for valid JWT in Authorization header
    ↓
❌ 401 Error: No valid JWT found
```

### After (Fixed):
```
RevenueCat sends webhook with our custom secret
    ↓
Supabase skips JWT verification (verify_jwt = false)
    ↓
✅ Function receives request
    ↓
Function verifies custom secret header
    ↓
✅ Processes webhook and updates database
```

---

## Security

With `verify_jwt = false`, we're relying on our custom webhook secret verification:

```typescript
const secretHeader = req.headers.get('Authorization')
if (secretHeader !== `Bearer ${REVENUECAT_WEBHOOK_SECRET}`) {
  return 401 Unauthorized
}
```

This is secure because:
- ✅ Only RevenueCat knows our webhook secret
- ✅ Secret is stored securely in Supabase environment variables
- ✅ Requests without correct secret are rejected

For production, you can also add:
- 🔐 IP whitelisting (only accept RevenueCat IPs)
- 🔐 Request signature verification
- 🔐 Rate limiting

---

## Test After Deployment

1. **Deploy the function** (command above)
2. **Configure RevenueCat webhook** (settings above)
3. **Send test event** from RevenueCat Dashboard
4. **Expected:** ✅ **200 OK**

Check Supabase logs:
```
✅ Webhook secret verified
📥 Received webhook: { event: { type: "INITIAL_PURCHASE", ... } }
✅ Subscription updated for user: ...
```

---

## Complete Test Flow

After successful webhook test:

```bash
flutter run
```

1. Navigate to Profile page
2. Tap "Get Premium"
3. Complete Test Store purchase (FREE - sandbox!)
4. Watch the magic:
   - RevenueCat processes purchase ✅
   - Webhook fires to Supabase ✅
   - Database updates ✅
   - App refreshes ✅
   - Profile shows "Premium"! 🎉

---

**Deploy the function and test it!** 🚀

The `.well-known/config.json` file will be included in the deployment automatically.
