//
//  ContentView.swift
//  Learning
//
//  Created by Isaac Pachon on 18/02/25.
//

import SwiftUI

struct InitView: View {
    //@State var prueba: String = ""
    var body: some View {
        VStack {
            Spacer()
            Image(.logoKDS)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                
            Spacer()
            
            Button(action: {
            }, label: {
                Text("Login")
                    .bold()
                    .frame(width: 150, height: 10)
                    .padding()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(10)
            })
            .shadow(radius: 15, y: 5)
            
            Button(action: {
            }, label: {
                Text("Sign Up")
                    .bold()
                    .frame(width: 150, height: 10)
                    .padding()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(10)
            })
            .shadow(radius: 15, y: 5)
            
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.baseYellow)
    }
}

#Preview {
    InitView()
}
