//
//  OrderDetailView.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import SwiftUI

struct OrderDetailView: View {
    let orderID: Int
    @StateObject private var viewModel = OrderDetailViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let order = viewModel.order {
                Text("Pedido #\(order.ORDE_ID)")
                    .font(.title)

                Text("Usuario: \(order.USER_ID)")
                Text("Fecha: \(order.ORDE_DATE)")
                Text("Estado: \(order.ORDE_STAT.capitalized)")
                Text("Total: $\(order.ORDE_TOTA, specifier: "%.2f")")

                Divider()

                Text("Productos:")
                    .font(.headline)

                ForEach(viewModel.orderDetails, id: \.PROD_ID) { detail in
                    Text("- Producto ID \(detail.PROD_ID), Cantidad: \(detail.ORDE_DETA_QUAN)")
                }
            } else {
                ProgressView("Cargando pedido...")
            }
        }
        .padding()
        .task {
            await viewModel.fetchOrderData(orderID: orderID)
        }
    }
}

