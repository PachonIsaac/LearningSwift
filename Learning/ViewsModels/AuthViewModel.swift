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
    
    func login(name: String, password: String) async {
        do {
            
            // Buscar en la base de datos el usuario
            let users: [User] = try await supabase
                .from("USERS")
                .select()
                .eq("USER_NAME", value: name)
                .eq("USER_PASS", value: password)
                .limit(1)
                .execute()
                .value
           
            guard let user = users.first else {
                DispatchQueue.main.async {
                    self.errorMessage = "Credenciales incorrectas."
                }
                return
            }
            
            // Guardamos el rol del usuario
            DispatchQueue.main.async {
                self.userRole = user.USER_ROLE
                self.isAuthenticated = true
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error de autenticación: \(error.localizedDescription)"
            }
        }
    }
}
