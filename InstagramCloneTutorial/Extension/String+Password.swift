//
//  String+Password.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 17.11.25.
//

import Foundation

extension String {
    func isValidPassword() -> Bool {
        return self.count >= 6
    }
}
