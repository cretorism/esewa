//
//  subiosApp.swift
//  subios
//
//  Created by user283867 on 3/3/26.
//

import SwiftUI

@main
struct subiosApp: App {
    @StateObject private var flutterManager = FlutterManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
