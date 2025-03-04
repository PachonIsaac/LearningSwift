//
//  LoginView.swift
//  Learning
//
//  Created by Isaac Pachon on 3/03/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            NavbarView()
            Spacer()
            Text("Welcome")
                .bold()
                .font(.title)
            
            Text("Username")
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    LoginView()
}
