//
//  AppRoute.swift
//  Learning
//
//  Created by Isaac Pachon on 5/05/25.
//

import Foundation

enum AppRoute: Hashable{
    case welcome
    case adminDashboard
    case clientDashboard
    case login
    case signUp
    case productDetails(Product)
}
