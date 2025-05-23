//
//  CartItem.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: Int // ID del producto
    let product: Product
    var quantity: Int
}

