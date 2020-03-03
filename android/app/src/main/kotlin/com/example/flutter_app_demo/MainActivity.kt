package com.example.flutter_app_demo

import android.annotation.TargetApi
import android.app.NativeActivity
import android.content.Intent
import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object{
        const val CHANNEL = "flutter.rortega.com.channel"
    }
  @TargetApi(Build.VERSION_CODES.GINGERBREAD)
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

      MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
         if (call.method == "showNativeView"){
             result.success("Nguyen quang thu");
         }else{
             result.notImplemented()
         }
      }
  }
}
