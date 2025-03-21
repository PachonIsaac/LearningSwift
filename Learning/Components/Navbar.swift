//
//  Navbar.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct Navbar: View {
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Image(.logoKDS)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                Text("KytchenDS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
            }
        } .padding()
            .frame(maxWidth: .infinity, maxHeight: 120)
            .background(.baseYellow)
            .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
            .ignoresSafeArea()
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
