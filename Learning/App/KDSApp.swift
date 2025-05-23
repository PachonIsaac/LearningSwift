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
    @StateObject private var coordinator = NavigationCoordinator()
    @StateObject var cartViewModel = CartViewModel()
    
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
            NavigationStack(path: $coordinator.path) {
                WelcomeView()
                    .navigationDestination(for: AppRoute.self) { route in
                        NavigationRouter(route: route)
                    }
            }
            .environmentObject(authViewModel)
            .environmentObject(coordinator)
            .environmentObject(cartViewModel)
        }
    }
}
