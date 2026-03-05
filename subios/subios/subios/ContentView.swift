//
//  ContentView.swift
//  subios
//
//  Created by user283867 on 3/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool
    @State private var showFlutterModule = false
    @StateObject private var flutterManager = FlutterManager.shared
    
    init() {
        _isLoggedIn = State(initialValue: AuthManager.shared.activeUser != nil)
    }
    
    var body: some View {
        if !isLoggedIn {
            LoginView(onLoginSuccess: {
                isLoggedIn = true
            })
        } else {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.green)
                
                Text("Authorized Access")
                    .font(.title)
                
                Text("Native iOS Session Active")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    showFlutterModule = true
                }) {
                    Text("Enter Flutter Catalog")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
            }
            .padding()
            .sheet(isPresented: $showFlutterModule) {
                FlutterView()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        flutterManager.onPaymentComplete = {
                            showFlutterModule = false
                            // Refresh login status after potential logout
                            isLoggedIn = AuthManager.shared.activeUser != nil
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
