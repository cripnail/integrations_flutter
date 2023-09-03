//package com.example.native_ui_app
package com.example.native_integration

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.native_integration/text_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "setText") {
                val text = call.arguments as String
                updateText(flutterEngine, text)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun updateText(flutterEngine: FlutterEngine, text: String) {
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.invokeMethod("updateText", text)
    }
}