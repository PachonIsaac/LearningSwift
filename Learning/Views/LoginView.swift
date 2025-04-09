import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State var showToast: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Welcome")
                    .bold()
                    .font(.largeTitle)
                
                TextField("Email", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    Task {
                        await viewModel.login(name: name, password: password)
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
            .toolbar {
                CustomToolbarContent(showCart: viewModel.isAuthenticated)
            }
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                destinationView()
            }
        }
    }
    
    @ViewBuilder
    private func destinationView() -> some View {
        if let role = viewModel.userRole {
            switch role {
            case "admin":
                AdminDashboardView()
                    .navigationBarBackButtonHidden()
            case "client":
                ClientDashboardView()
                    .navigationBarBackButtonHidden()
            default:
                Text("Rol desconocido")
            }
        }
    }
}

#Preview {
    LoginView()
}
