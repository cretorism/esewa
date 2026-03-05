import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isRegisterMode = false
    @State private var errorMessage: String?
    @AppStorage("theme_mode") private var themeMode: String = "light"
    var onLoginSuccess: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.shield.fill")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            Text(isRegisterMode ? "Create Account" : "eSewa Secure Login")
                .font(.title2)
                .fontWeight(.bold)

            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button(action: performAuth) {
                Text(isRegisterMode ? "Register" : "Login")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Button(action: { isRegisterMode.toggle() }) {
                Text(isRegisterMode ? "Already have an account? Login" : "New here? Create account")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
        .overlay(
            Button(action: {
                themeMode = (themeMode == "light") ? "dark" : "light"
                FlutterManager.shared.refreshConfig()
            }) {
                Image(systemName: themeMode == "light" ? "moon.fill" : "sun.max.fill")
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(Circle())
            }
            .padding(),
            alignment: .topTrailing
        )
        .preferredColorScheme(themeMode == "light" ? .light : .dark)
    }

    private func performAuth() {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Fields cannot be empty"
            return
        }
        
        if isRegisterMode {
            if AuthManager.shared.register(id: username, pass: password) {
                if AuthManager.shared.login(id: username, pass: password) != nil {
                    onLoginSuccess()
                }
            } else {
                errorMessage = "User already exists"
            }
        } else {
            if AuthManager.shared.login(id: username, pass: password) != nil {
                onLoginSuccess()
            } else {
                errorMessage = "Invalid ID or Password"
            }
        }
    }
}
