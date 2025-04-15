//
//  ClientDashboardView.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct ClientDashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var categoryVM = CategoryViewModel()
    @StateObject var productVM = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                CustomAppBar(showCart: viewModel.isAuthenticated)
                
                Text("Categorías")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                    .padding(.top)
                
                //For de las categorias.
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categoryVM.categories) { category in
                            Button(action: {}) {
                                CategoryItem(category: category)
                            }
                        }
                    }
                }
                
                //For de los productos.
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(productVM.products) { product in
                            Button(action: {}) {
                                ProductCard(product: product)
                            }
                        }
                    }.frame(maxHeight: 220)
                        .padding(.horizontal)
                }
                
                Spacer()
                
            }
            .onAppear {
                Task {
                    await categoryVM.fetchCategories()
                    await productVM.fetchProducts()
                }
            }
        }
    }
}
