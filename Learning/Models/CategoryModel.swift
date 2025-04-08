//
//  CategoryModel.swift
//  Learning
//
//  Created by Isaac Pachon on 8/04/25.
//

import Foundation

struct Category: Decodable, Identifiable {
    let CATE_ID: Int
    let CATE_NAME: String
    let CATE_IMAG_URL: String?
    
    var id: Int {CATE_ID}
}
