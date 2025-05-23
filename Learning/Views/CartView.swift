//
//  CartView.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var showConfirmation = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(cartViewModel.items) { item in
                    HStack {
                        Text(item.product.PROD_NAME)
                        Spacer()
                        Text("x\(item.quantity)")
                        Text("$\(Float(item.quantity) * item.product.PROD_PRICE, specifier: "%.2f")")
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        cartViewModel.removeFromCart(productID: cartViewModel.items[index].id)
                    }
                }
            }
            
            Text("Total: $\(cartViewModel.totalPrice, specifier: "%.2f")")
                .bold()
                .padding()
            
            Button("Realizar Pedido") {
                print("Pedido Realizado")
                Task {
                    do {
                        guard let userID = authViewModel.userID, !userID.isEmpty else {
                            errorMessage = "Usuario no autenticado."
                            showError = true
                            return
                        }
                        
                        try await cartViewModel.createOrder(userID: userID)
                        showConfirmation = true
                    } catch {
                        errorMessage = error.localizedDescription
                        print(errorMessage)
                        showError = true
                    }
                }
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .navigationTitle("Carrito")
    }
}

