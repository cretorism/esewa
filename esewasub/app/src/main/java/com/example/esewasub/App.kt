package com.example.esewasub

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.Context
import android.util.Log

class App : Application() {
    companion object {
        const val FLUTTER_ENGINE_ID = "esewa_flutter_engine"
    }

    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()

        // Initialize Flutter engine
        flutterEngine = FlutterEngine(this)

        // Set up MethodChannel on the pre-warmed engine BEFORE execution
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.app.native/flutter")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getAppConfig" -> {
                        result.success(buildAppConfig())
                    }
                    "refreshConfig" -> {
                        // This would be coming from native, but we can have it for symmetry
                        result.success(null)
                    }
                    "initiatePayment" -> {
                        val payload = call.arguments as? Map<String, Any>
                        handlePaymentRequest(payload)
                        result.success(null)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }

        // Start the engine
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Register plugins
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Cache the engine
        FlutterEngineCache.getInstance().put(FLUTTER_ENGINE_ID, flutterEngine)
    }

    fun refreshConfig() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.app.native/flutter")
            .invokeMethod("refreshConfig", buildAppConfig())
    }

    fun buildAppConfig(): Map<String, Any> {
        val prefs = SecurityProvider.getEncryptedPrefs(this)
        val uuid = prefs.getString("uuid", "") ?: ""
        val username = AuthManager.getActiveUser(this) ?: "Guest"
        val themeMode = prefs.getString("theme_mode", "light") ?: "light"
        
        val colors = if (themeMode == "dark") {
            mapOf(
                "primary" to "#BB86FC", // Standard Material Dark Primary
                "secondary" to "#03DAC6",
                "background" to "#121212",
                "surface" to "#1E1E1E", // Slightly lighter surface for elevaton
                "textPrimary" to "#E1E1E1", // Soft white
                "textSecondary" to "#A0A0A0",
                "error" to "#CF6679",
                "success" to "#81C784"
            )
        } else {
            mapOf(
                "primary" to "#2196F3",
                "secondary" to "#018786",
                "background" to "#FFFFFF",
                "surface" to "#FFFFFF",
                "textPrimary" to "#000000",
                "textSecondary" to "#757575",
                "error" to "#B00020",
                "success" to "#4CAF50"
            )
        }

        return mapOf(
            "uuid" to uuid,
            "username" to username,
            "themeMode" to themeMode,
            "colors" to colors,
            "spacing" to mapOf(
                "small" to 8.0,
                "medium" to 16.0,
                "large" to 24.0
            ),
            "typography" to mapOf(
                "bodySize" to 16.0,
                "titleSize" to 20.0,
                "fontFamily" to "Roboto"
            )
        )
    }

    private fun handlePaymentRequest(payload: Map<String, Any>?) {
        Log.d("App", "Payment requested from Flutter: $payload")
        // Note: Use FLAG_ACTIVITY_NEW_TASK if starting an activity from here
    }
}
