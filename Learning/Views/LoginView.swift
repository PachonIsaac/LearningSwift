import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State var showToast: Bool = false
    
    var body: some View {
        
        VStack {
            CustomAppBar(showCart: false)
            Spacer()
            
            Text("Welcome")
                .bold()
                .font(.largeTitle)
            
            TextField("Email", text: $name)
                .autocapitalization(.none)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal)
            
            Button(action: {
                Task {
                    await viewModel.login(name: name, password: password)
                    if let role = viewModel.userRole {
                        switch role {
                        case "admin":
                            coordinator.goTo(.adminDashboard)
                        case "client":
                            coordinator.goTo(.clientDashboard)
                        case "chef":
                            coordinator.goTo(.kitchen)
                        default:
                            print("Rol Desconocido")
                        }
                    }
                }
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .bold()
                    .padding()
                    .background(.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding()
            
            if showToast, let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(10)
                    .transition(.opacity)
                    .animation(.easeInOut, value: 8)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
    }
}
