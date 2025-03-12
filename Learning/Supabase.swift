//
//  Supabase.swift
//  Learning
//
//  Created by Isaac Pachon on 12/03/25.
//
import Foundation
import Supabase

let SupabaseKey: String = try Configuration.value(for: "supabaseKey")

let client = SupabaseClient(
    supabaseURL: URL(string: "")!,
    supabaseKey: SupabaseKey
)

