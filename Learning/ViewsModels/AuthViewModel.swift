//
//  AuthViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var navigationPath: [AppRoute] = []
    
    func goToLogin() {
        navigationPath.append(.login)
    }
    
    func goToSignUp() {
        navigationPath.append(.signUp)
    }
}
