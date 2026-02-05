//
//  MockAuthService.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 03.02.26.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
   
    func createUser(withEmail email: String, password: String, username: String) async throws -> String {
        return "mock_uid_12345"
    }
    
    func deleteAccount() async {
    }
    
    func getUserSession() -> String? {
        return "mock_uid_12345"
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        return "mock_uid_12345"
    }

    func signOut() {
        
    }
    
    func validateEmail(_ email: String) async throws -> Bool {
        return false
    }
    
    func validateUsername(_ username: String) async throws -> Bool {
        return false
    }
}
