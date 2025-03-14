//
//  CredentialsApp.swift
//  Learning
//
//  Created by Isaac Pachon on 13/03/25.
//

import Foundation

struct CredentialsSupabase {
    static let supabaseUrl = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String ?? ""
    static let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String ?? ""
}
