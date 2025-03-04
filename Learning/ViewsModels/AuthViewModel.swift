//
//  AuthViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    
    
    func login() {
        if username == "admin" && password == "admin" {
            errorMessage = nil
        } else {
            errorMessage = "Wrong Credentials"
        }
    }
    
}
