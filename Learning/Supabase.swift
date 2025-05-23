//
//  Supabase.swift
//  Learning
//
//  Created by Isaac Pachon on 12/03/25.
//
import Foundation
import Supabase

let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String ?? ""

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://buyvwbxhgakyjynjvxku.supabase.co")!,
    supabaseKey: supabaseKey

)

