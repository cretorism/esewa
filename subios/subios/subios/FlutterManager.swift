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
        // init flutter engine
        let engine = FlutterEngine(name: "esewa_flutter_engine")
        self.flutterEngine = engine
        
        
        // start engine immediately
        engine.run()
        
        // set up method channel after running the engine
        methodChannel = FlutterMethodChannel(
            name: "com.app.native/flutter",
            binaryMessenger: engine.binaryMessenger
        )
        
        methodChannel?.setMethodCallHandler { [weak self] (call, result) in
            self?.handleMethodCall(call, result: result)
        }
        
        // register plugins
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
            // requirement: clear cache/session
            AuthManager.shared.logout()
            
            // return to native app (dismiss flutter sheet)
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
        print("payment requested from flutter: \(String(describing: payload))")
        // handle payment logic here
        
     
        /*
        AuthManager.shared.verifyPayment(payload) { success in 
            if success { self.onPaymentComplete?() }
        }
        */

        // requirement: handle payment without closing flutter module
        // dispatchqueue.main.async {
        //     self.onpaymentcomplete?()
        // }
    }
    

    
    func refreshConfig() {
        methodChannel?.invokeMethod("refreshConfig", arguments: buildAppConfig())
    }
}

extension FlutterManager: ObservableObject {}
