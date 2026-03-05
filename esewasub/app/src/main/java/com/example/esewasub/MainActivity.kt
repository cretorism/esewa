package com.example.esewasub

import android.content.Context
import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.app.native/flutter"

        /**
         * Launch MainActivity using the pre-warmed cached Flutter engine.
         */
        fun createIntent(context: Context): Intent {
            return CachedEngineIntentBuilder(MainActivity::class.java, App.FLUTTER_ENGINE_ID)
                .build(context)
        }
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return FlutterEngineCache.getInstance().get(App.FLUTTER_ENGINE_ID)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getAppConfig" -> {
                    // Delegate to App class to keep config logic centralized
                    val app = application as? App
                    result.success(app?.buildAppConfig() ?: emptyMap<String, Any>())
                }
                "initiatePayment" -> {
                    val payload = call.arguments as? Map<String, Any>
                    Log.d("MainActivity", "Payment Received - Returning to Native: $payload")
                    
                    // Requirement: Return to Native app (Now just logs and stays)
                    result.success(null)
                    // finish() 
                }
                "logout" -> {
                    // Requirement: Clear cache/session
                    AuthManager.logout(this@MainActivity)
                    
                    // Return to Login
                    startActivity(Intent(this@MainActivity, LoginActivity::class.java))
                    (application as? App)?.refreshConfig()
                    result.success(null)
                    finish()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        (application as? App)?.refreshConfig()
    }

    private fun buildAppConfig(): Map<String, Any> {
        val app = application as? App
        return app?.buildAppConfig() ?: emptyMap()
    }
}