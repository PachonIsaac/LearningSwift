import SwiftUI

struct CustomToolbarContent: ToolbarContent {
    var showCart: Bool = false
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                Image(.logoKDS)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text("KytchenDS")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        
        if showCart {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                }
            }
        }
    }
}
