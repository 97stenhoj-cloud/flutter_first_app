// lib/core/services/auth_service.dart
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io' show Platform;
import '../config/env.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final SupabaseClient _supabase = Supabase.instance.client;
  
  // Use secure environment variable
  static final String _googleWebClientId = Env.googleWebClientId;
  
  // Get current user
  User? get currentUser => _supabase.auth.currentUser;
  
  // Check if user is logged in
  bool get isLoggedIn => currentUser != null;

  // Stream of auth state changes
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  // Sign in with Google
  Future<AuthResponse?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: _googleWebClientId,
      );

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null; // User cancelled

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw 'No Access Token or ID Token found.';
      }

      return await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      debugPrint('Google Sign In Error: $e');
      rethrow;
    }
  }

  // Sign in with Apple
  Future<AuthResponse?> signInWithApple() async {
    try {
      if (!Platform.isIOS && !Platform.isMacOS) {
        throw 'Apple Sign In is only available on iOS and macOS';
      }

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        throw 'No ID Token received from Apple';
      }

      return await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
      );
    } catch (e) {
      debugPrint('Apple Sign In Error: $e');
      rethrow;
    }
  }

  // Sign up with email and password (fallback)
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'display_name': displayName},
    );
  }

  // Sign in with email and password (fallback)
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign out
  Future<void> signOut() async {
    // Sign out from Google if signed in with Google
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
    } catch (e) {
      // Ignore if not signed in with Google
    }
    
    await _supabase.auth.signOut();
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  // Get user subscription data
  Future<Map<String, dynamic>?> getUserSubscription() async {
    if (!isLoggedIn) return null;

    final response = await _supabase
        .from('user_subscriptions')
        .select()
        .eq('user_id', currentUser!.id)
        .maybeSingle();

    return response;
  }

  // Update user subscription (FIXED: Uses is_premium instead of subscription_tier)
  Future<void> updateSubscription({
    required List<String> unlockedBundles,
    required String tier,
  }) async {
    if (!isLoggedIn) return;

    try {
      final isPremium = tier == 'premium';
      
      // Try to update first - only set is_premium, not subscription_tier
      final result = await _supabase
          .from('user_subscriptions')
          .update({
            'unlocked_bundles': unlockedBundles,
            'is_premium': isPremium,
          })
          .eq('user_id', currentUser!.id)
          .select();

      // If no rows were updated, insert a new one
      if (result.isEmpty) {
        debugPrint('🆕 Creating new subscription row for user');
        await _supabase.from('user_subscriptions').insert({
          'user_id': currentUser!.id,
          'unlocked_bundles': unlockedBundles,
          'is_premium': isPremium,
        });
      }
      
      debugPrint('✅ Subscription updated: is_premium=$isPremium');
    } catch (e) {
      debugPrint('❌ Error updating subscription: $e');
      rethrow;
    }
  }

  // Check if bundle is unlocked
  Future<bool> isBundleUnlocked(String bundle) async {
    final subscription = await getUserSubscription();
    if (subscription == null) return false;

    final unlockedBundles = List<String>.from(subscription['unlocked_bundles'] ?? []);
    return unlockedBundles.contains(bundle);
  }

  // Get all unlocked bundles
  Future<List<String>> getUnlockedBundles() async {
    final subscription = await getUserSubscription();
    if (subscription == null) return [];

    return List<String>.from(subscription['unlocked_bundles'] ?? []);
  }

  // Get subscription tier (FIXED: Uses is_premium boolean)
  Future<String> getSubscriptionTier() async {
    if (!isLoggedIn) return 'free';
    
    try {
      final subscription = await getUserSubscription();
      if (subscription == null) {
        debugPrint('   No subscription row found - user is free tier');
        return 'free';
      }
      
      // Check is_premium boolean instead of subscription_tier string
      final isPremium = subscription['is_premium'] as bool? ?? false;
      final tier = isPremium ? 'premium' : 'free';
      
      debugPrint('   Subscription data: $subscription');
      debugPrint('   Determined tier: $tier');
      
      return tier;
    } catch (e) {
      debugPrint('❌ Error getting subscription tier: $e');
      return 'free';
    }
  }
}