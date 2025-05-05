//
//  ProductModel.swift
//  Learning
//
//  Created by Isaac Pachon on 14/04/25.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    let PROD_ID: Int
    let PROD_NAME: String
    let PROD_DESC: String
    let PROD_PRICE: Float
    let PROD_AVAI: Bool
    let PROD_IMAG_URL: String?
    let CATE_ID: Int
    
    var id: Int {PROD_ID}
}


