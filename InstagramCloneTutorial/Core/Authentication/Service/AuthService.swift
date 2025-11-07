//
//  AuthService.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 01.09.25.
//

import FirebaseAuth
import FirebaseFirestore

struct AuthService {
    
    func login(withEmail email: String, password: String) async throws -> String {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            print("DEBUG-> Failed to sign in a user: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            await uploadUserDate(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG-> Failed to register a user: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        try await UserService.shared.fetchCurrentUser()
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        UserService.shared.currentUser = nil
    }
    
    private func uploadUserDate(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username , email: email)
        UserService.shared.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await FirebaseConstants.UsersCollection.document(user.id).setData(encodedUser)
    }
}
