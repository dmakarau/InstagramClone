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
    var showError = false
    var error: AuthenticationError? {
        didSet { showError = error != nil }
    }
    
    func login(with authManager: AuthManager) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch let error as AuthenticationError {
            self.error = error
        }
        catch {
            self.error = .unknownError
        }
    }
}
