//
//  ProductDetailsView.swift
//  Learning
//
//  Created by Isaac Pachon on 5/05/25.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    @State private var quantity: Int = 1
    @State private var showConfirmation = false
    @State private var comment = ""
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.PROD_IMAG_URL ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                .cornerRadius(10)
                
                Text(product.PROD_NAME)
                    .font(.title)
                    .bold()
                
                Text(product.PROD_DESC)
                    .foregroundColor(.gray)
                
                Text("Precio: $\(String(format: "%.0f", product.PROD_PRICE))")
                    .font(.headline)
                
                Stepper("Cantidad: \(quantity)", value: $quantity, in: 1...10)
                
                TextField("Comentario (opcional)", text: $comment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Agregar al carrito") {
                    print("Agregar al carrito")
                    cartViewModel.addToCart(product: product, quantity: quantity)
                    showConfirmation = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.yellow)
                .foregroundColor(.black)
                .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Producto añadido"),
                    message: Text("Se añadió al carrito correctamente."),
                    dismissButton: .default(Text("OK")) {
                        coordinator.goBack()
                    }
                )
            }
        }
        .navigationTitle("Detalle del producto")
    }
}

