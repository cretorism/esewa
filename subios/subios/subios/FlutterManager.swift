import Foundation
import Flutter
import FlutterPluginRegistrant

class FlutterManager: NSObject, ObservableObject {
    static let shared = FlutterManager()
    
    var flutterEngine: FlutterEngine?
    var methodChannel: FlutterMethodChannel?
    var onPaymentComplete: (() -> Void)?
    
    private override init() {
        super.init()
        setupEngine()
    }
    
    func setupEngine() {
        // Initialize Flutter Engine
        flutterEngine = FlutterEngine(name: "esewa_flutter_engine")
        
        // Set up Method Channel BEFORE running the engine
        if let engine = flutterEngine {
            methodChannel = FlutterMethodChannel(
                name: "com.app.native/flutter",
                binaryMessenger: engine.binaryMessenger
            )
            
            methodChannel?.setMethodCallHandler { [weak self] (call, result) in
                self?.handleMethodCall(call, result: result)
            }
        }
        
        // Start the engine
        flutterEngine?.run()
        
        // Register plugins
        if let engine = flutterEngine {
            GeneratedPluginRegistrant.register(with: engine)
        }
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
