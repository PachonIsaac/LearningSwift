//
//  NavigationRouter.swift
//  Learning
//
//  Created by Isaac Pachon on 5/05/25.
//

import SwiftUI

@MainActor
struct NavigationRouter: View {
    let route: AppRoute
    
    var body: some View {
        switch route {
        case .welcome:
            WelcomeView()
            
        case .clientDashboard:
            ClientDashboardView()
                .navigationBarBackButtonHidden()
            
        case .login:
            LoginView()
                .navigationBarBackButtonHidden()
            
        case .adminDashboard:
            AdminDashboardView()
                .navigationBarBackButtonHidden()
            
        case .signUp:
            SignUpView()
                .navigationBarBackButtonHidden()
            
        case .productDetails(let product):
            ProductDetailsView(product: product)
                //.navigationBarBackButtonHidden()
            
        case .cart:
            CartView()
            
        case .kitchen:
            KitchenDashboardView()
            
        case .orderDetail(let orderID):
            OrderDetailView(orderID: orderID)
                
        }
    }
}
