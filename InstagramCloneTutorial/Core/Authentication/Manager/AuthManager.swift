//
//  AuthManager.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 07.11.25.
//

import Foundation
/**
 This class is responsible for managing authentication-related tasks such as login,
 logout, and user session management.
 */
@Observable
class AuthManager {
    @ObservationIgnored private let service: AuthService
    var userSession: String?

    
    init(service: AuthService) {
        self.service = service
    }
    
    func login(withEmail email: String, password: String) async throws {
        self.userSession = try await service.login(withEmail: email, password: password)
    }
    
    func createUser(email: String, password: String, username: String) async throws -> User? {
        return nil
    }
    
    func deleteAccount() async {
        
    }
    
    func sendResetPassword(to email: String) async throws {
    }
    
    func signOut() {
    }



}
