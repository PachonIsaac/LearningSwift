//
//  KitchenDashboardView.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import SwiftUI

struct KitchenDashboardView: View {
    @StateObject private var vm = KitchenViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.orders) { order in
                    VStack(alignment: .leading) {
                        Text("Pedido #\(order.ORDE_ID ?? 0)")
                            .font(.headline)
                        Text("Estado: \(order.ORDE_STAT)")
                        Text("Fecha: \(order.ORDE_DATE)")
                    }
                    .contextMenu {
                        Button("Marcar como en progreso") {
                            Task {
                                try? await vm.updateOrderStatus(orderID: order.ORDE_ID ?? 0, newStatus: "in progress")
                                await vm.fetchOrders()
                            }
                        }
                        Button("Marcar como listo") {
                            Task {
                                try? await vm.updateOrderStatus(orderID: order.ORDE_ID ?? 0, newStatus: "ready")
                                await vm.fetchOrders()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pedidos Cocina")
            .task {
                await vm.fetchOrders()
            }
        }
    }
}

