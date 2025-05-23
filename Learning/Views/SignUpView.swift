//
//  SignUpView.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack(spacing: 24) {
            CustomAppBar(showCart: false)
            
            Spacer()
            Text("Crear Cuenta")
                .font(.title3)
                .bold()
            Spacer()
            
            Text("Nombre Completo")
                .frame(maxWidth: .infinity, alignment:.leading)
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.horizontal)
            
            TextField("Nombre de usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding(.horizontal)
            
            Text("Correo electronico")
                .frame(maxWidth: .infinity, alignment:.leading)
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.horizontal)
            
            TextField("Correo electrónico", text: $viewModel.mail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            Text("Contraseña")
                .frame(maxWidth: .infinity, alignment:.leading)
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.horizontal)
            
            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Confirmar contraseña")
                .frame(maxWidth: .infinity, alignment:.leading)
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.horizontal)
            
            SecureField("Confirmar contraseña", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
            Spacer()
            
            Button("Registrarse") {
                Task {
                    await viewModel.signUp()
                }
            }
            //.frame(maxWidth: .infinity)
            .padding(.init(top: 15, leading: 140, bottom: 15, trailing: 140))
            .background(.yellow)
            .foregroundColor(.black)
            .cornerRadius(10)
            
            Spacer()
        }
        .alert("Registro exitoso", isPresented: $viewModel.showSuccessPopup) {
            Button("Aceptar") {
                coordinator.goTo(.login)
            }
        } message: {
            Text("Tu cuenta ha sido creada correctamente.")
        }
        
    }
}

