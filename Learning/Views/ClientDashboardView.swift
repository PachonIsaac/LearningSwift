//
//  ClientDashboardView.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct ClientDashboardView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var categoryVM = CategoryViewModel()
    @StateObject private var productViewModel = ProductViewModel()
    
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

                ForEach(productViewModel.categories) { category in
                    VStack(alignment: .leading) {
                        Text(category.CATE_NAME)
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)

                        if let products = productViewModel.groupedProducts[category.CATE_ID] {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(products) { product in
                                        ProductCard(product: product)
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
                await productViewModel.fetchData()
            }
        }
    }
}
