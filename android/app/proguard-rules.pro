# ProGuard Rules for Connect App - IP Protection Configuration
# This file protects intellectual property by obfuscating sensitive business logic

# ============================================================================
# FLUTTER FRAMEWORK (Required for Flutter apps to work)
# ============================================================================
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.firebase.** { *; }

# Dart AOT compiled code
-keep class io.flutter.embedding.** { *; }

# ============================================================================
# INTELLECTUAL PROPERTY PROTECTION
# ============================================================================

# Obfuscate all application code (highest priority for IP protection)
-keep,allowobfuscation class com.stenhoej.connect.** { *; }

# Specifically obfuscate sensitive business logic classes
# These contain premium unlock logic, subscription tiers, and monetization strategy
-keep,allowobfuscation class com.stenhoej.connect.core.providers.** { *; }
-keep,allowobfuscation class com.stenhoej.connect.core.services.** { *; }
-keep,allowobfuscation class com.stenhoej.connect.features.ai_deck.** { *; }
-keep,allowobfuscation class com.stenhoej.connect.features.spark.** { *; }
-keep,allowobfuscation class com.stenhoej.connect.features.pandora.** { *; }

# ============================================================================
# SECURITY: REMOVE DEBUG INFORMATION
# ============================================================================

# Remove all logging statements in production builds
# This prevents information leakage about business logic
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Remove debug print statements
-assumenosideeffects class java.io.PrintStream {
    public void println(%);
    public void println(**);
}

# Remove stack trace information (makes reverse engineering harder)
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# ============================================================================
# OPTIMIZATION SETTINGS
# ============================================================================

# Enable aggressive optimization
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose

# Allow obfuscation of class names and package names
-repackageclasses ''
-allowaccessmodification

# ============================================================================
# REQUIRED FOR THIRD-PARTY LIBRARIES
# ============================================================================

# Gson (if used for JSON serialization)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }

# Supabase / Realtime libraries
-keep class io.supabase.** { *; }
-dontwarn io.supabase.**

# Google Sign-In
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Keep native methods (required for JNI calls)
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep custom exceptions (for proper error handling)
-keep public class * extends java.lang.Exception

# ============================================================================
# ANDROID SYSTEM REQUIREMENTS
# ============================================================================

# Keep Android components
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Keep view constructors (required for XML layouts)
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# Keep Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ============================================================================
# ANNOTATIONS
# ============================================================================

# Keep annotations for reflection
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeInvisibleAnnotations
-keepattributes AnnotationDefault

# Keep generic signatures for debugging
-keepattributes Signature

# ============================================================================
# REFLECTION SUPPORT
# ============================================================================

# If app uses reflection, keep class names
-keepattributes InnerClasses
-keep class **.R$* { *; }

# ============================================================================
# END OF PROGUARD RULES
# ============================================================================
