//
//  String+Username.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 17.11.25.
//

import Foundation

extension String {
    func isValidUsername() -> Bool {
        let usernameRegex = "^(?!.*__)[A-Za-z][A-Za-z0-9_]{1,18}[A-Za-z0-9]$"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernameTest.evaluate(with: self)
    }
}
