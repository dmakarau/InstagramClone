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
        self.userSession = service.getUserSession()
    }
    
    func login(withEmail email: String, password: String) async throws {
        self.userSession = try await service.login(withEmail: email, password: password)
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        self.userSession = try await service
            .createUser(
                email: email,
                password: password,
                username: username
            )
    }
    
    func validateEmail(_ email: String) async throws -> Bool {
        return try await service.validateEmail(email)
    }
    
    func validateUsername(_ username: String) async throws -> Bool {
        return try await service.validateUsername(username)
    }
    
    func deleteAccount() async {
        
    }
    
    func sendResetPassword(to email: String) async throws {
    }
    
    func signOut() {
        service.signOut()
        userSession = nil
    }
}
