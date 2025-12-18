# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# Keep Kotlin metadata so that reflection based serializers (Jackson, Moshi, etc.)
# can continue to discover data class properties in release builds.
-keep class kotlin.Metadata { *; }

# Preserve the Health Connect data models that are cached via Jackson so the
# generated JSON keeps the expected field names.
-keep class me.ayra.ha.healthconnect.data.** { *; }

-keepclassmembers class me.ayra.ha.healthconnect.models.** { *; }
-keepattributes Signature,EnclosingMethod,InnerClasses


# Prevent R8 from stripping properties from ANY class used by Jackson
-keepattributes EnclosingMethod,InnerClasses,Signature,AnnotationDefault,*Annotation*
-keepclassmembers class * {
    @com.fasterxml.jackson.annotation.* *;
}

# Specifically protect the class S4.f (and others in its package)
# Based on your log, S4 seems to be the package name after obfuscation
-keep class S4.** { *; }

# Also keep the Kotlin data class metadata
-keep class kotlin.Metadata { *; }

# Verhindert, dass R8 die Datenmodelle für Jackson unbrauchbar macht
-keepattributes Signature,EnclosingMethod,InnerClasses,*Annotation*,PermittedSubclasses
-keep class kotlin.Metadata { *; }

# Ersetze 'me.ayra.ha.healthconnect.models' durch das Paket deiner Datenklassen
-keep class me.ayra.ha.healthconnect.** { *; }

# Verhindert das Entfernen von Serialisierungseigenschaften generell
-keepclassmembers class * {
    @com.fasterxml.jackson.annotation.* *;
    public <methods>;
    public <fields>;
}

