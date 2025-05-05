//
//  ClientDashboardView.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct ClientDashboardView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject var categoryVM = CategoryViewModel()
    @StateObject private var productVM = ProductViewModel()
    
    var body: some View {
        
        CustomAppBar(showCart: authVM.isAuthenticated)
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
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

                ForEach(productVM.categories) { category in
                    VStack(alignment: .leading) {
                        Text(category.CATE_NAME)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        if let products = productVM.groupedProducts[category.CATE_ID] {
                            //For de los productos
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(products) { product in
                                        Button(action: {
                                            coordinator.goTo(.productDetails(product))
                                        }) {
                                            ProductCard(product: product)
                                        }
                                    }
                                }
                                .frame(height: 220)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await categoryVM.fetchCategories()
                await productVM.fetchData()
            }
        }
    }
}
