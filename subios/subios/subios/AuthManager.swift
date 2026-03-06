import Foundation
import CryptoKit

class AuthManager {
    static let shared = AuthManager()
    
    private let service = "com.app.esewa"
    private let activeUserKey = "active_user_id"
    
    var activeUser: String? {
        UserDefaults.standard.string(forKey: activeUserKey)
    }
    
    func register(id: String, pass: String) -> Bool {
        if KeychainHelper.shared.read(service: service, account: "user_\(id)") != nil {
            return false // user already exists
        }
        
        let hashedPass = hashPassword(pass)
        let uuid = UUID().uuidString
        
        KeychainHelper.shared.save(hashedPass, service: service, account: "user_\(id)")
        KeychainHelper.shared.save(uuid, service: service, account: "uuid_\(id)")
        
        return true
    }
    
    func login(id: String, pass: String) -> String? {
        guard let storedHash = KeychainHelper.shared.read(service: service, account: "user_\(id)") else {
            return nil
        }
        
        if hashPassword(pass) == storedHash {
            let uuid = KeychainHelper.shared.read(service: service, account: "uuid_\(id)") ?? UUID().uuidString
            UserDefaults.standard.set(id, forKey: activeUserKey)
            KeychainHelper.shared.save(uuid, service: service, account: "user_uuid") // current session uuid
            
            FlutterManager.shared.refreshConfig()
            return uuid
        }
        return nil
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: activeUserKey)
        KeychainHelper.shared.save("", service: service, account: "user_uuid")
    }
    
    private func hashPassword(_ pass: String) -> String {
        let inputData = Data(pass.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
