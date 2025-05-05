//
//  ContentView.swift
//  Learning
//
//  Created by Isaac Pachon on 18/02/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            Spacer()
            Image(.logoKDS)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
            Spacer()
            
            Button(action: {
                coordinator.goTo(.login)
            }){
                Text("Login")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(24)
                    .shadow(radius: 16)
            }.padding(8)
            
            Button(action: {
                coordinator.goTo(.signUp)
            }) {
                Text("Sign Up")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(24)
                    .shadow(radius: 16)
            }.padding(8)
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.baseYellow)
    }
}

