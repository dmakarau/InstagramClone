//
//  MockUserService.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 05.02.26.
//


struct MockUserService: UserServiceProtocol {
    func fetchCurrentUser() async throws -> User? {
        return nil
    }
}