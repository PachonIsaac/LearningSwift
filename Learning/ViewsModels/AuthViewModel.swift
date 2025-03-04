//
//  AuthViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String? = nil
    
    
    func login(username: String, password: String) {
        if username == "admin" && password == "admin"{
            isAuthenticated = true
        } else {
            errorMessage = "Wrong Credentials"
        }
    }
    
}
