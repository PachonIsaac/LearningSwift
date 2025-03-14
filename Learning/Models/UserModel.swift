//
//  UserCredentials.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import Foundation

struct User: Decodable {
    let USER_ID: String //UUID en String
    let USER_NAME: String
    let USER_MAIL: String
    let USER_ROLE: String
}
