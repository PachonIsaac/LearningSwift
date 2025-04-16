//
//  ProductViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 15/04/25.
//

import Foundation
import Supabase

@MainActor
class ProductViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var groupedProducts: [Int: [Product]] = [:] // key = CATE_ID
    
    func fetchData() async {
        do {
            async let fetchedCategories: [Category] = supabase
                .from("CATEGORIES")
                .select()
                .execute()
                .value

            async let fetchedProducts: [Product] = supabase
                .from("PRODUCTS")
                .select()
                .execute()
                .value

            categories = try await fetchedCategories
            let products = try await fetchedProducts
            groupedProducts = Dictionary(grouping: products) { $0.CATE_ID }

        } catch {
            print("Error al obtener datos: \(error)")
        }
    }
}

