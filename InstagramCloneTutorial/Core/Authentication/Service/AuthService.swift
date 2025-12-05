//
//  AuthService.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 01.09.25.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

struct AuthService {
    
    func login(withEmail email: String, password: String) async throws -> String {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            let authErrorCode = AuthErrorCode(rawValue: (error as NSError).code)?.rawValue ?? -1
            throw AuthenticationError(rawValue: authErrorCode)
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws -> String {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return result.user.uid
        } catch {
            let authErrorCode = AuthErrorCode(rawValue: (error as NSError).code)?.rawValue ?? -1
            throw AuthenticationError(rawValue: authErrorCode)
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    func getUserSession() -> String? {
        // Return nil if Firebase isn't configured yet to prevent crash
        guard FirebaseApp.app() != nil else { return nil }
        return Auth.auth().currentUser?.uid
    }
    
    func checkForExistingSession() -> String? {
        // This method should be called AFTER Firebase is configured
        return Auth.auth().currentUser?.uid
    }
    
//    private func uploadUserDate(uid: String, username: String, email: String) async {
//        let user = User(id: uid, username: username , email: email)
//        UserService.shared.currentUser = user
//        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
//        try? await FirebaseConstants.UsersCollection.document(user.id).setData(encodedUser)
//    }
}
