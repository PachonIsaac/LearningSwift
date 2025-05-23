//
//  AuthViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import Foundation
import Supabase

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String? = nil
    @Published var userRole: String? = nil
    @Published var userID: String?

    
    @MainActor
    func login(name: String, password: String) async {
        do {
            let users: [User] = try await supabase
                .from("USERS")
                .select()
                .eq("USER_NAME", value: name)
                .eq("USER_PASS", value: password)
                .limit(1)
                .execute()
                .value
            
            guard let user = users.first else {
                self.errorMessage = "Credenciales incorrectas."
                return
            }

            self.userID = user.USER_ID
            self.userRole = user.USER_ROLE
            self.isAuthenticated = true

        } catch {
            self.errorMessage = "Error de autenticación: \(error.localizedDescription)"
        }
    }
    
    //Sign Up
    
}
