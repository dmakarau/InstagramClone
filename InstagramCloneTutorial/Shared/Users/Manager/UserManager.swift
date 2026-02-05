//
//  UserManager.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 11.11.25.
//

import Foundation

@Observable
class UserManager {
    var currentUser: User?
    @ObservationIgnored private let service: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.service = userService
    }
    
    func fetchCurrentUser() async {
        do {
            currentUser = try await service.fetchCurrentUser()
        } catch {
            print("DEBUG - Error fetching current user: \(error)")
        }
    }
}
