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
    @ObservationIgnored private let service: UserService
    
    init(userService: UserService) {
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
