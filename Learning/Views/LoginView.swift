//
//  LoginView.swift
//  Learning
//
//  Created by Isaac Pachon on 3/03/25.
//
import Foundation
import SwiftUI
import Supabase

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    @State private var name: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            NavbarView()
            Spacer()
            
            Text("Welcome")
                .bold()
                .font(.largeTitle)
            
            TextField("Email", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let errorMessage = viewModel.errorMessage{
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                Task{
                    await viewModel.login(name:name, password: password)
                }
            }){
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .bold()
                    .padding()
                    .background(.baseYellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    
            }
            .padding()
            
            
            if viewModel.isAuthenticated {
                HomeView()
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}

