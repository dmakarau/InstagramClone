//
//  CreateUsernameView.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 19.08.25.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AuthManager.self) private var authManager
    @Environment(RegistrationViewModel.self) private var viewModel
    @Environment(AuthenticationRouter.self) private var router
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your username. You can always change this later.")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Username", text: $viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
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

private extension CreateUsernameView {
    var formIsValid: Bool {
        return viewModel.username.isValidUsername()
    }
    
    func onNext() {
        Task {
            let userIsValide = try await authManager.validateUsername(viewModel.username)
            
            if userIsValide {
                router.navigate()
            } else {
                print("DEBUG: Validation failed")
            }
        }
    }
}

#Preview {
    CreateUsernameView()
}
