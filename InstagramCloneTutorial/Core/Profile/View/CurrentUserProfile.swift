//
//  CurrentUserProfile.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 20.08.25.
//

import SwiftUI

struct CurrentUserProfile: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager

    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                if let user = userManager.currentUser {
                    ProfileHeaderView(user: user)
                    // post grid view
                    PostGridView(user: user)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        authManager.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfile()
}
