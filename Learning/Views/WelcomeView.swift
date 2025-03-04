//
//  ContentView.swift
//  Learning
//
//  Created by Isaac Pachon on 18/02/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                Spacer()
                Image(.logoKDS)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Spacer()
                
                Button("Login") {
                    viewModel.goToLogin()
                }
                .bold()
                .frame(width: 150, height: 10)
                .padding()
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 15, y: 5)
                
                Button("Sign Up") {
                    viewModel.goToSignUp()
                }
                .bold()
                .frame(width: 150, height: 10)
                .padding()
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 15, y: 5)
                
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route{
                case .login:
                    LoginView()
                case .signUp:
                    SignUpView()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.baseYellow)
        }
        
    }
    
}

#Preview {
    WelcomeView()
}
