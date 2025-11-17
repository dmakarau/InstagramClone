//
//  ContentView.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 13.08.25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    
    var body: some View {
        Group {
            if authManager.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
        .task(id: authManager.userSession) {
            guard authManager.userSession != nil else { return }
            await userManager.fetchCurrentUser()
        }
    }
}

#Preview {
    ContentView()
}
