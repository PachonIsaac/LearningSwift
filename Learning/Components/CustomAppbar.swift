//
//  CustomAppbar.swift
//  Learning
//
//  Created by Isaac Pachon on 15/04/25.
//

import SwiftUI

struct CustomAppBar: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var showCart: Bool = false
    
    var body: some View {
        ZStack {
            Color.baseYellow.ignoresSafeArea(edges: .top)
            
            HStack {
                Image(.logoKDS)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Spacer()
                
                Text("KytchenDS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                if showCart {
                    Button(action: {
                        coordinator.goTo(.cart)
                    }) {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .padding()
        }
        .frame(height: 60)
    }
}

