//
//  OrderDetailViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//
import Foundation
 
@MainActor
class OrderDetailViewModel: ObservableObject {
    @Published var order: Order?
    @Published var orderDetails: [OrderDetail] = []

    func fetchOrderData(orderID: Int) async {
        do {
            let orders: [Order] = try await supabase
                .from("ORDERS")
                .select()
                .eq("ORDE_ID", value: orderID)
                .execute()
                .value

            self.order = orders.first

            let details: [OrderDetail] = try await supabase
                .from("ORDE_DETA")
                .select()
                .eq("ORDE_ID", value: orderID)
                .execute()
                .value

            self.orderDetails = details
        } catch {
            print("Error al obtener el detalle del pedido:", error.localizedDescription)
        }
    }
}
