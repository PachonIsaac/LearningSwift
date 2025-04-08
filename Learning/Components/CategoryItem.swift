//
//  CategotyItem.swift
//  Learning
//
//  Created by Isaac Pachon on 7/04/25.
//

import SwiftUI

struct CategoryItem: View {
    var category: Category
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.CATE_IMAG_URL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .shadow(radius: 5)
            
            Text(category.CATE_NAME)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        .padding()
    }
}


