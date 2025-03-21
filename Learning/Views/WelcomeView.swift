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
        NavigationStack{
            VStack {
                Spacer()
                Image(.logoKDS)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Spacer()
                
                NavigationLink(destination: LoginView()
                    .navigationBarBackButtonHidden(true)
                    
                ){
                    Text("Login")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(24)
                        .shadow(radius: 16)
                }.padding(8)
                
                
                NavigationLink(destination: SignUpView()
                    .navigationBarBackButtonHidden(true)
                ){
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
}

#Preview {
    WelcomeView()
}
