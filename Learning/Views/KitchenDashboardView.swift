//
//  KitchenDashboardView.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import SwiftUI

struct KitchenDashboardView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject private var viewModel = KitchenViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.orders) { order in
                    OrderCardView(order: order) { newStatus in
                        Task {
                            await viewModel.updateOrderStatus(orderID: order.ORDE_ID, to: newStatus)
                        }
                    } onDetail: {
                        coordinator.goTo(.orderDetail(orderID: order.ORDE_ID))
                    }
                }
            }
            .padding()
        }
        .task {
            await viewModel.fetchOrders()
        }
    }
}


struct OrderCardView: View {
    let order: Order
    var onStatusChange: (String) -> Void
    var onDetail: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Pedido #\(order.ORDE_ID)")
                    .font(.headline)
                Spacer()
                Text(order.ORDE_STAT.capitalized)
                    .font(.caption)
                    .padding(6)
                    .background(statusColor(order.ORDE_STAT))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Text("Usuario: \(order.USER_ID)")
                .font(.subheadline)
            Text("Total: $\(order.ORDE_TOTA, specifier: "%.2f")")
                .font(.subheadline)

            Picker("Estado", selection: .init(
                get: { order.ORDE_STAT },
                set: { newStatus in onStatusChange(newStatus) }
            )) {
                Text("Pending").tag("pending")
                Text("Preparing").tag("preparing")
                Text("Ready").tag("ready")
            }
            .pickerStyle(.segmented)

            Button("Ver Detalles", action: onDetail)
                .padding(.top, 4)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(12)
    }

    private func statusColor(_ status: String) -> Color {
        switch status {
        case "pending": return .red
        case "preparing": return .yellow
        case "ready": return .green
        default: return .gray
        }
    }
}
