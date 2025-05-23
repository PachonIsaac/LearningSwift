//
//  KitchenOrdersViewModel.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//


import Foundation
import Supabase

@MainActor
class KitchenViewModel: ObservableObject {
    @Published var orders: [Order] = []
    @Published var errorMessage: String?

    func fetchOrders() async {
        do {
            let fetchedOrders: [Order] = try await supabase
                .from("ORDERS")
                .select()
                .in("ORDE_STAT",values: ["pending", "in progress"])
                .order("ORDE_DATE", ascending: true)
                .execute()
                .value

            DispatchQueue.main.async {
                self.orders = fetchedOrders
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }

    func updateOrderStatus(orderID: Int, to newStatus: String) async {
            do {
                try await supabase
                    .from("ORDERS")
                    .update(["ORDE_STAT": newStatus])
                    .eq("ORDE_ID", value: orderID)
                    .execute()
                
                await fetchOrders() // Refrescar lista
            } catch {
                print("Error actualizando estado: \(error)")
            }
        }
}
