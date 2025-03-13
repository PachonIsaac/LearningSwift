//
//  AuthViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import Foundation
import Supabase

class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String? = nil
    @Published var userRole: String? = nil
    
    private let client = SupabaseClient(
        supabaseURL: URL(string: "https://buyvwbxhgakyjynjvxku.supabase.co")!,
        supabaseKey: CredentialsSupabase.supabaseKey
    )
    
    func login(email: String, password: String) async {
        do {
            // Intentar iniciar sesión con Supabase Auth
            let authResponse = try await client.auth.signIn(email: email, password: password)
            
            // Obtener el usuario autenticado
            guard let session = authResponse.session else {
                DispatchQueue.main.async {
                    self.errorMessage = "No se pudo obtener la sesión del usuario."
                }
                return
            }
            
            // Buscar en la base de datos el usuario con ese correo
            let users: [User] = try await client.database
                .from("USERS")
                .select()
                .eq("USER_MAIL", email)
                .limit(1)
                .execute()
                .decoded()
            
            guard let user = users.first else {
                DispatchQueue.main.async {
                    self.errorMessage = "Usuario no encontrado en la base de datos."
                }
                return
            }
            
            // Guardamos el rol del usuario
            DispatchQueue.main.async {
                self.userRole = user.role
                self.isAuthenticated = true
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error de autenticación: \(error.localizedDescription)"
            }
        }
    }
}
