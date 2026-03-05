import SwiftUI
import Flutter

struct FlutterView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FlutterViewController {
        guard let engine = FlutterManager.shared.flutterEngine else {
            return FlutterViewController()
        }
        
        return FlutterViewController(engine: engine, nibName: nil, bundle: nil)
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {
        // No updates needed
    }
}
