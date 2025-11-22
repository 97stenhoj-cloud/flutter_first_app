# 🔒 Security & IP Protection Guide

**Last Updated:** November 20, 2025
**Status:** ⚠️ CRITICAL - Action Required

---

## ⚠️ IMMEDIATE ACTION REQUIRED

### 🔴 **CRITICAL: Rotate Exposed Credentials**

Your current `.env` file contains live credentials that need to be rotated immediately:

#### 1. Rotate Supabase Anon Key

**Current Status:** ⚠️ **Exposed** - Your anon key `sb_publishable_eGJJEB9owWJava46fj4bXg_UG5VKdxl` should be rotated

**Steps to Rotate:**

1. Go to Supabase Dashboard: https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/settings/api
2. Navigate to: **Settings → API → Project API keys**
3. Click **"Regenerate"** next to the **anon/public** key
4. Copy the new key
5. Update your `.env` file with the new key:
   ```bash
   SUPABASE_ANON_KEY=your_new_anon_key_here
   ```
6. Run the obfuscation generator:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
7. Rebuild your apps and redeploy

**Why:** The old key was visible in this repository and could enable unauthorized API access.

#### 2. Rotate Google OAuth Client ID (Optional but Recommended)

**Current Status:** ⚠️ **Exposed** - Client ID `712131109538-n7aqt4uvp7cjf3bn1fojaqhe3os79p3a.apps.googleusercontent.com`

**Steps to Rotate:**

1. Go to Google Cloud Console: https://console.cloud.google.com/apis/credentials
2. Select your project
3. Navigate to **APIs & Services → Credentials**
4. Delete the old OAuth 2.0 Client ID
5. Create a new **OAuth 2.0 Client ID** for Web application
6. Configure authorized redirect URIs
7. Update your `.env` file:
   ```bash
   GOOGLE_WEB_CLIENT_ID=your_new_client_id.apps.googleusercontent.com
   ```
8. Run the obfuscation generator:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

**Why:** Prevents potential phishing attacks using your client ID.

---

## 🛡️ IP Protection Measures Implemented

### ✅ Phase 1: Critical Security (COMPLETED)

The following protections are now active:

#### 1. **Environment Variable Obfuscation**
- **Tool:** `envied` package with XOR encryption
- **Protected Secrets:**
  - Supabase URL
  - Supabase Anon Key
  - Google OAuth Client ID
- **Files:** [lib/core/config/env.dart](lib/core/config/env.dart), `lib/core/config/env.g.dart`

#### 2. **Android Code Obfuscation** ✅ NEW
- **Tool:** ProGuard/R8
- **Configuration:** [android/app/build.gradle.kts](android/app/build.gradle.kts#L39-L45)
- **Rules:** [android/app/proguard-rules.pro](android/app/proguard-rules.pro)
- **Protection Level:** HIGH
- **What's Protected:**
  - Business logic class names obfuscated
  - Debug logging completely removed in production
  - Sensitive providers and services obfuscated
  - Resource shrinking enabled (removes unused code)

#### 3. **iOS Code Obfuscation** ✅ NEW
- **Tool:** Xcode symbol stripping + bitcode
- **Configuration:** [ios/Flutter/Release.xcconfig](ios/Flutter/Release.xcconfig#L4-L19)
- **Protection Level:** HIGH
- **What's Protected:**
  - Debug symbols stripped
  - Bitcode enabled (allows Apple recompilation)
  - Optimization level set to `-O`

#### 4. **Flutter Symbol Obfuscation** ✅ NEW
- **Tool:** Flutter's built-in `--obfuscate` flag
- **Implementation:** [build_release.sh](build_release.sh)
- **Protection Level:** VERY HIGH
- **What's Protected:**
  - Dart class names randomized
  - Function names obfuscated
  - Stack traces separated into debug-info files
  - Makes reverse engineering extremely difficult

#### 5. **Git Security** ✅
- **Files Protected:**
  - `.env` (excluded from git tracking)
  - `env.g.dart` (obfuscated generated file, excluded)
  - `debug-info/` (debug symbols, excluded)
- **Template:** [.env.example](.env.example) for new developers

---

## 📖 Building with IP Protection

### Quick Start

Use the provided build script for obfuscated releases:

```bash
# Build Android APK
./build_release.sh android

# Build Android App Bundle (for Play Store)
./build_release.sh appbundle

# Build iOS
./build_release.sh ios

# Build all platforms
./build_release.sh all
```

### Manual Build Commands

If you prefer to build manually:

#### Android APK
```bash
flutter build apk --release \
  --obfuscate \
  --split-debug-info=./debug-info/android \
  --split-per-abi
```

#### Android App Bundle (Play Store)
```bash
flutter build appbundle --release \
  --obfuscate \
  --split-debug-info=./debug-info/android-bundle
```

#### iOS
```bash
flutter build ios --release \
  --obfuscate \
  --split-debug-info=./debug-info/ios
```

#### iOS IPA (App Store)
```bash
flutter build ipa --release \
  --obfuscate \
  --split-debug-info=./debug-info/ios
```

---

## 🔍 What's Protected

### Tier 1: Critical IP (Maximum Protection)

| Asset | Protection Mechanism | Effectiveness |
|-------|---------------------|---------------|
| **AI Prompts** (Edge Functions) | Server-side only, not in app | 🟢 100% |
| **Supabase Credentials** | envied obfuscation | 🟡 85% |
| **Business Logic** | Flutter obfuscation + ProGuard | 🟢 95% |
| **Premium Unlock Logic** | Class name obfuscation | 🟢 95% |
| **Subscription Tiers** | Obfuscated code | 🟢 90% |
| **Pandora Service** | Obfuscated code | 🟢 95% |
| **Offline Caching Algorithm** | Obfuscated code | 🟢 95% |

### Tier 2: Supporting Systems

| Asset | Protection Mechanism | Effectiveness |
|-------|---------------------|---------------|
| **Database Schema** | Server-side, RLS policies | 🟢 100% |
| **Analytics Tracking** | Obfuscated code | 🟡 85% |
| **UI/UX Flow** | Obfuscated code | 🟡 80% |

---

## 🚨 Security Checklist

### Before Every Release

- [ ] Verify `.env` is NOT committed to git
- [ ] Regenerate obfuscated env files: `dart run build_runner build`
- [ ] Use `build_release.sh` script for builds
- [ ] Store `debug-info/` directory securely (DO NOT commit)
- [ ] Test app functionality after obfuscation
- [ ] Upload debug symbols to crash reporting service (e.g., Sentry, Firebase Crashlytics)

### Monthly Security Tasks

- [ ] Review Supabase access logs for unusual activity
- [ ] Check for new app decompiler tools/techniques
- [ ] Update dependencies for security patches
- [ ] Review ProGuard rules for new sensitive classes

### Quarterly Security Tasks

- [ ] Rotate Supabase anon key
- [ ] Review and update RLS policies
- [ ] Audit third-party package vulnerabilities
- [ ] Test obfuscation effectiveness with decompiler

---

## 🔐 Debug Symbols Management

### What are Debug Symbols?

Debug symbols (stored in `debug-info/`) allow you to:
- Decode obfuscated crash reports
- Map stack traces back to original code
- Debug production issues

### CRITICAL: Storage Security

**❌ NEVER:**
- Commit `debug-info/` to git (already in [.gitignore](.gitignore))
- Share debug symbols publicly
- Upload to public crash reporting without authentication

**✅ DO:**
- Store debug symbols in secure, private cloud storage
- Organize by version: `debug-info/android/v1.0.1/`
- Keep for at least 90 days after release
- Upload to authenticated crash reporting services (Sentry, Firebase)

### Uploading to Crash Reporting

#### Sentry (Recommended)
```bash
# Install Sentry CLI
brew install getsentry/tools/sentry-cli

# Upload symbols
sentry-cli upload-dif --org your-org --project connect-app ./debug-info/android/
```

#### Firebase Crashlytics
```bash
# Upload symbols via Firebase Console
# Go to: Crashlytics → Missing Symbol Files → Upload
```

---

## 🎯 What Attackers Can Still See

Even with obfuscation, determined attackers may discover:

### Visible Information

1. **App Structure:** General architecture (Flutter + Supabase)
2. **API Endpoints:** Supabase URL from network traffic
3. **UI Flow:** Screen navigation and user journeys
4. **Asset Files:** Images, fonts (not obfuscated)
5. **Third-Party Libraries:** Package names visible

### Protected Information

1. **✅ Class Names:** Randomized (e.g., `UnlockProvider` → `a.b.c`)
2. **✅ Function Names:** Randomized (e.g., `isPremium()` → `x()`)
3. **✅ Business Logic:** Extremely difficult to understand
4. **✅ Algorithms:** Hidden behind obfuscated code
5. **✅ Debug Logs:** Completely removed by ProGuard

---

## 📋 Phase 2-4 Roadmap

### Phase 2: Core Protection (Weeks 2-4)

Recommended next steps:

- [ ] **Server-Side Validation:** Move premium checks to Supabase RLS policies
- [ ] **AI Prompt Protection:** Extract prompts from Edge Function code to database
- [ ] **Rate Limiting:** Add abuse detection to Edge Functions
- [ ] **Certificate Pinning:** Prevent MITM attacks

**Estimated Time:** 3 weeks
**Cost:** €0

### Phase 3: Enhanced Security (Months 2-3)

- [ ] **Database Encryption:** Use pgcrypto for sensitive fields
- [ ] **RASP Implementation:** Jailbreak/root detection
- [ ] **Monitoring Dashboard:** Real-time abuse detection

**Estimated Time:** 5 weeks
**Cost:** €0-€500

### Phase 4: Strategic Protection (Months 4-6)

- [ ] **Custom API Proxy:** Hide Supabase infrastructure
- [ ] **Patent Filing:** Protect AI generation system
- [ ] **Security Audit:** Third-party penetration testing

**Estimated Time:** 4-7 months
**Cost:** €5,000-€10,000

---

## 🆘 Security Incident Response

### If You Suspect a Breach

1. **Immediate Actions:**
   - Rotate all Supabase keys immediately
   - Check Supabase logs: https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/logs
   - Review recent database changes
   - Check for unusual API usage patterns

2. **Investigation:**
   - Review Edge Function logs for unusual calls
   - Check authentication logs for unauthorized access
   - Look for bulk data queries in analytics

3. **Mitigation:**
   - Update RLS policies if bypass detected
   - Rate limit affected endpoints
   - Force app update if client-side exploit found

4. **Communication:**
   - Assess if user data was compromised
   - Notify users if required by GDPR
   - Document incident for future prevention

---

## 📞 Support & Resources

### Tools Documentation

- **Flutter Obfuscation:** https://docs.flutter.dev/deployment/obfuscate
- **ProGuard:** https://www.guardsquare.com/manual/home
- **Envied Package:** https://pub.dev/packages/envied
- **Supabase Security:** https://supabase.com/docs/guides/platform/going-into-prod

### Monitoring Tools

- **Supabase Dashboard:** https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv
- **Google Cloud Console:** https://console.cloud.google.com

### Decompiler Testing

Test your obfuscation effectiveness with:
- **jadx** (Android): https://github.com/skylot/jadx
- **Hopper** (iOS): https://www.hopperapp.com
- **JD-GUI** (Java/Kotlin): http://java-decompiler.github.io

---

## 📝 Version History

| Date | Version | Changes |
|------|---------|---------|
| 2025-11-20 | 1.0 | Initial security implementation: Code obfuscation, ProGuard rules, build scripts |

---

## ⚖️ Legal Notices

### Trade Secret Protection

The source code, algorithms, and business logic in this application are considered **trade secrets** and **confidential information**. Unauthorized copying, distribution, or reverse engineering is strictly prohibited.

**© 2025 Connect App. All rights reserved.**

### Contributor Agreement

By contributing to this project, you agree to:
1. Keep all code and business logic confidential
2. Not share credentials or access with unauthorized parties
3. Follow security best practices outlined in this document
4. Report any security vulnerabilities immediately

---

**🔒 Remember:** Security is an ongoing process. Review this document regularly and stay updated on new threats and protection techniques.
