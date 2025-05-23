//
//  OrderModel.swift
//  Learning
//
//  Created by Isaac Pachon on 22/05/25.
//

import Foundation

struct NewOrder: Codable {
    let USER_ID: String
    let ORDE_DATE: String
    let ORDE_TOTA: Float
    let ORDE_STAT: String
}

struct Order: Codable, Identifiable {
    let ORDE_ID: Int
    let USER_ID: String
    let ORDE_DATE: String
    let ORDE_TOTA: Float
    let ORDE_STAT: String

    var id: Int { ORDE_ID }
}


struct OrderDetail: Codable {
    let ORDE_ID: Int
    let PROD_ID: Int
    let ORDE_DETA_QUAN: Int
}

struct InsertedOrderID: Decodable {
    let ORDE_ID: Int
}



