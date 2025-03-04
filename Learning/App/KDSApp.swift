//
//  LearningApp.swift
//  Learning
//
//  Created by Isaac Pachon on 18/02/25.
//

import SwiftUI

@main
struct KDSApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(authViewModel)
        }
    }
}
