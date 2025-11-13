//
//  RegistrationViewMode.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 01.09.25.
//

import Foundation
import Observation

@Observable
class RegistrationViewModel {
    var username =  ""
    var email =  ""
    var password =  ""
    var error: Error?
    
    func createUser(with authManager: AuthManager) async  {
        do {
            let user = try await authManager.createUser(email: email, password: password, username: username)
            reset()
        }
        catch {
            self.error = error
        }
    }
    
    private func reset() {
        username = ""
        email = ""
        password = ""
        error = nil
    }
}
