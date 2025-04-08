//
//  HomeView.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct ClientDashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var categoryVM = CategoryViewModel()
    
    var body: some View {
        VStack {
            Navbar(showCart: viewModel.isAuthenticated)
            
            Text("Categorías")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
                .bold()
                .padding(.leading)
                
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryVM.categories) { category in
                        Button(action: {
                            // Acción al tocar categoría
                        }) {
                            CategoryItem(category: category)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .onAppear {
            Task {
                await categoryVM.fetchCategories()
            }
        }
    }
}

