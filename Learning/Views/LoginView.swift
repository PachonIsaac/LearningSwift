//
//  LoginView.swift
//  Learning
//
//  Created by Isaac Pachon on 3/03/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavbarView()
            Spacer()
            
            Text("Welcome")
                .bold()
                .font(.largeTitle)
            
            TextField("Username", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login"){
                viewModel.login(username: "admin", password: "admin")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.baseYellow)
            .foregroundColor(.black)
            .cornerRadius(10)
            .padding()
            
            // Mensaje de error si falla el login
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onChange(of: viewModel.isAuthenticated) { isAuthenticated in
            if isAuthenticated {
                dismiss()  // Cierra la pantalla de login al autenticarse
            }
        }
    }
}

#Preview {
    LoginView()
}

