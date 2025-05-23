//
//  CartViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import Foundation

@MainActor
class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    
    // Añadir producto al carrito
    func addToCart(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.PROD_ID == product.PROD_ID }) {
            items[index].quantity += quantity
        } else {
            let newItem = CartItem(id: product.PROD_ID, product: product, quantity: quantity)
            items.append(newItem)
        }
    }
    
    // Remover producto
    func removeFromCart(productID: Int) {
        items.removeAll { $0.product.PROD_ID == productID }
    }
    
    // Vaciar carrito
    func clearCart() {
        items.removeAll()
    }
    
    // Calcular total
    var totalPrice: Float {
        items.reduce(0) { $0 + ($1.product.PROD_PRICE * Float($1.quantity)) }
    }
    
    //Crear Orden
    func createOrder(userID: String) async throws {
        let order = NewOrder(
            USER_ID: userID,
            ORDE_DATE: ISO8601DateFormatter().string(from: Date()),
            ORDE_TOTA: totalPrice,
            ORDE_STAT: "pending"
        )

        let insertedOrder: [InsertedOrderID] = try await supabase
            .from("ORDERS")
            .insert(order)
            .select("ORDE_ID")
            .execute()
            .value

        guard let orderID = insertedOrder.first?.ORDE_ID else {
            throw NSError(domain: "OrderError", code: 1, userInfo: [NSLocalizedDescriptionKey: "No se pudo obtener el ID del pedido."])
        }

        let orderDetails = items.map {
            OrderDetail(ORDE_ID: orderID, PROD_ID: $0.product.PROD_ID, ORDE_DETA_QUAN : $0.quantity)
        }

        try await supabase
            .from("ORDE_DETA")
            .insert(orderDetails)
            .execute()

        clearCart()
    }

    
}
