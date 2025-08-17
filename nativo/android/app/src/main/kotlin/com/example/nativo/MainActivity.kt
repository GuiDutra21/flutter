package com.example.nativo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){

    private val CAHNNEL = "gui.com.br/nativo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "gui.com.br/nativo")
        .setMethodCallHandler { call, result ->
        
            if (call.method == "calcSum") {
                val a = call.argument<Int>("a") ?: 0
                val b = call.argument<Int>("b") ?: 0
                result.success(a + b)
            } else {
                result.notImplemented()
            }
        }
}
}
