//
//  CategoryViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 8/04/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var errorMessage: String? = nil

    func fetchCategories() async {
        do {
            let data: [Category] = try await supabase
                .from("CATEGORIES")
                .select()
                .execute()
                .value

            DispatchQueue.main.async {
                self.categories = data
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error al cargar categorías: \(error.localizedDescription)"
            }
        }
    }
}
