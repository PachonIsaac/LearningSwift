//
//  Navbar.swift
//  Learning
//
//  Created by Isaac Pachon on 4/03/25.
//

import SwiftUI

struct NavbarView: View {

    var body: some View {
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
            .padding()
            .frame(maxWidth: .infinity)
            .background(.baseYellow)
            .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))   
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
