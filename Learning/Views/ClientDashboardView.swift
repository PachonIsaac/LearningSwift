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
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Categorías")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categoryVM.categories) { category in
                            Button(action: {}) {
                                CategoryItem(category: category)
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("")
            .toolbar {
                CustomToolbarContent(showCart: viewModel.isAuthenticated)
            }
            .onAppear {
                Task {
                    await categoryVM.fetchCategories()
                }
            }
        }
    }
}
