import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "com.example.native_integration/text_channel"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupMethodChannel()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func setupMethodChannel() {
        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
            channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
                if call.method == "setText" {
                    if let text = call.arguments as? String {
                        self?.updateText(text)
                        result(nil)
                    }
                } else {
                    result(FlutterMethodNotImplemented)
                }
            }
        }
    }

    private func updateText(_ text: String) {
        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
            channel.invokeMethod("updateText", arguments: text)
        }
    }
}