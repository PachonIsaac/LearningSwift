//
//  SignUpViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 5/05/25.
//

import Foundation
import Supabase

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var username = ""
    @Published var mail = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var registrationSuccess = false
    @Published var showSuccessPopup = false


    func signUp() async {
        guard !username.isEmpty, !mail.isEmpty, !password.isEmpty else {
            errorMessage = "Todos los campos son obligatorios."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden."
            return
        }

        do {
            // Verifica si ya existe un usuario con ese email
            let existingUsers: [User] = try await supabase
                .from("USERS")
                .select()
                .eq("USER_MAIL", value: mail)
                .limit(1)
                .execute()
                .value
            
            guard existingUsers.isEmpty else {
                errorMessage = "El correo ya está registrado."
                return
            }

            // Inserta el nuevo usuario
            let insertResult = try await supabase
                .from("USERS")
                .insert([
                    "USER_NAME": username,
                    "USER_PASS": password,
                    "USER_MAIL": mail,
                    "USER_ROLE": "client"
                ])
                .execute()

            registrationSuccess = true
            showSuccessPopup = true

        } catch {
            errorMessage = "Error durante el registro: \(error.localizedDescription)"
        }
    }
}

