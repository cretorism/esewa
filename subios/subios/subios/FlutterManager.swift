import Foundation
import SwiftUI
import Combine
import Flutter
import FlutterPluginRegistrant

public final class FlutterManager: NSObject {
    public static let shared = FlutterManager()
    
    @Published var flutterEngine: FlutterEngine?
    @Published var methodChannel: FlutterMethodChannel?
    var onPaymentComplete: (() -> Void)?
    
    public override init() {
        super.init()
        setupEngine()
    }
    
    func setupEngine() {
        // 1. Initialize Flutter Engine
        let engine = FlutterEngine(name: "esewa_flutter_engine")
        self.flutterEngine = engine
        
        // 2. Start the engine immediately
        engine.run()
        
        // 3. Set up Method Channel AFTER running the engine
        methodChannel = FlutterMethodChannel(
            name: "com.app.native/flutter",
            binaryMessenger: engine.binaryMessenger
        )
        
        methodChannel?.setMethodCallHandler { [weak self] (call, result) in
            self?.handleMethodCall(call, result: result)
        }
        
        // 4. Register plugins
        GeneratedPluginRegistrant.register(with: engine)
    }
    
    private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getAppConfig":
            result(buildAppConfig())
        case "initiatePayment":
            let args = call.arguments as? [String: Any]
            handlePaymentRequest(args)
            result(nil)
        case "logout":
            // Requirement: Clear cache/session
            AuthManager.shared.logout()
            
            // Return to Native app (dismiss Flutter sheet)
            DispatchQueue.main.async {
                self.onPaymentComplete?()
            }
            self.refreshConfig()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func buildAppConfig() -> [String: Any] {
        let uuid = KeychainHelper.shared.read(service: "com.app.esewa", account: "user_uuid") ?? ""
        let username = AuthManager.shared.activeUser ?? "Guest"
        let themeMode = UserDefaults.standard.string(forKey: "theme_mode") ?? "light"
        
        let colors: [String: String]
        if themeMode == "dark" {
            colors = [
                "primary": "#BB86FC",
                "secondary": "#03DAC6",
                "background": "#121212",
                "surface": "#1E1E1E",
                "textPrimary": "#E1E1E1",
                "textSecondary": "#A0A0A0",
                "error": "#CF6679",
                "success": "#81C784"
            ]
        } else {
            colors = [
                "primary": "#2196F3",
                "secondary": "#018786",
                "background": "#FFFFFF",
                "surface": "#FFFFFF",
                "textPrimary": "#000000",
                "textSecondary": "#757575",
                "error": "#B00020",
                "success": "#4CAF50"
            ]
        }
        
        return [
            "uuid": uuid,
            "username": username,
            "themeMode": themeMode,
            "colors": colors,
            "spacing": [
                "small": 8.0,
                "medium": 16.0,
                "large": 24.0
            ],
            "typography": [
                "bodySize": 16.0,
                "titleSize": 20.0,
                "fontFamily": "Inter"
            ]
        ]
    }
    
    private func handlePaymentRequest(_ payload: [String: Any]?) {
        print("Payment requested from Flutter: \(String(describing: payload))")
        // Handle payment logic here
        
        // Requirement: Handle payment without closing Flutter module
        // DispatchQueue.main.async {
        //     self.onPaymentComplete?()
        // }
    }
    
    func refreshConfig() {
        methodChannel?.invokeMethod("refreshConfig", arguments: buildAppConfig())
    }
}

extension FlutterManager: ObservableObject {}
