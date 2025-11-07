//
//  LoginViewModel.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 01.09.25.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var email: String = ""
    var password: String = ""
    var error: Error?
    
    func login(with authManager: AuthManager) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch {
            self.error = error
        }
    }
}
