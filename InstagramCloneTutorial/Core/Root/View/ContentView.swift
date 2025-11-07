//
//  ContentView.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 13.08.25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) private var authManager
    var body: some View {
        Group {
            if authManager.userSession == nil {
                LoginView()
            } else {
                Text("Show main interface here")
            }
        }
    }
}

#Preview {
    ContentView()
}
