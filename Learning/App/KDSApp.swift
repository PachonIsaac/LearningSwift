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
    
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color.baseYellow)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(authViewModel)
        }
    }
}
