//
//  AddEmailView.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 19.08.25.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AuthManager.self) private var authManager
    @Environment(RegistrationViewModel.self) private var viewModel
    @Environment(AuthenticationRouter.self) private var router
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            
            Button {
                onNext()
            } label: {
                Text("Next")
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
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
        }
    }
}


private extension AddEmailView {
    var formIsValid: Bool {
        return viewModel.email.isEmailValid()
    }
    
    func onNext() {
        Task {
            let emailIsValide = try await authManager.validateEmail(viewModel.email)
            
            if emailIsValide {
                router.navigate()
            } else {
                print("DEBUG: Validation failed")
            }
        }
    }
}

#Preview {
    AddEmailView()
}
