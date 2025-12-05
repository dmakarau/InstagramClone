//
//  LoginView.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 19.08.25.
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthManager.self) private var authManager
    @State var loginViewModel = LoginViewModel()
    @State private var registrationViewModel = RegistrationViewModel()
    @State private var router = AuthenticationRouter()
    var body: some View {
        @Bindable var loginViewModel = loginViewModel
        NavigationStack(path: $router.navigationPath) {
            VStack {
                
                Spacer()
                
                // Logo image
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $loginViewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Enter your password", text: $loginViewModel.password)
                        .modifier(IGTextFieldModifier())
                }
                
                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task { await loginViewModel.login(with: authManager) }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.5)
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(
                            width: (UIScreen.main.bounds.width / 2) - 40,
                            height: 0.5
                        )
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(
                            width: (UIScreen.main.bounds.width / 2) - 40,
                            height: 0.5
                        )
                }
                .foregroundStyle(.gray)
                
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                Button {
                    router.startRegistration()
                } label: {
                    HStack (spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
            .alert("Oops!", isPresented: $loginViewModel.showError, actions: {}) {
                Text(loginViewModel.error?.localizedDescription ?? "Unknown error")
            }
            .navigationDestination(for: RegistrationSteps.self) { step in
                Group {
                    switch step {
                    case .email:
                        AddEmailView()
                    case .username:
                        CreateUsernameView()
                    case .password:
                        CreatePasswordView()
                    case .completion:
                        CompleteSighUpView()
                    }
                }
                .navigationBarBackButtonHidden()
                .environment(router)
            }
        }
        .environment(registrationViewModel) // ← Provide to entire NavigationStack
    }
}

private extension LoginView {
    var formIsValid: Bool {
        return loginViewModel.email.isEmailValid() &&
        loginViewModel.password.isValidPassword()
    }
}

#Preview {
    LoginView()
}
