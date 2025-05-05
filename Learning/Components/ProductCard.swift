//
//  ProductCard.swift
//  Learning
//
//  Created by Isaac Pachon on 14/04/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
          
            // Imagen del producto desde URL
            AsyncImage(url: URL(string: product.PROD_IMAG_URL ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                @unknown default:
                    EmptyView()
                }
            }
            
            // Nombre del producto
            Text(product.PROD_NAME)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .lineLimit(1)
            
            // Descripción breve
            Text(product.PROD_DESC)
                .font(.footnote)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            // Precio
            Text("$\(String(format: "%.0f", product.PROD_PRICE))")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
        .frame(maxWidth: 150, maxHeight: 200)
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}
