//
//  ProductViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 15/04/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String? = nil
    
    func fetchProducts() async {
        do {
            let data: [Product] = try await supabase
                .from("PRODUCTS")
                .select()
                .execute()
                .value
            
            DispatchQueue.main.async {
                self.products = data
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error al cargar categorías: \(error.localizedDescription)"
            }
        }
    }
}
