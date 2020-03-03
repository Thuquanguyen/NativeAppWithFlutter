import UIKit
import Flutter

@available(iOS 9.3, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let CHANNEL = "flutter.rortega.com.channel"
    let getSong = GetDataSong()
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let nativeChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
    nativeChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: FlutterResult) -> Void in
        guard call.method == "showNativeView" else {
            result(FlutterMethodNotImplemented)
            return
        }
        getSong.getSong(result: result)
    })
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
