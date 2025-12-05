//  RegistrationSteps.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 17.11.25.
//

import Foundation

enum RegistrationSteps: Int {
    case email
    case username
    case password
    case completion
}

extension RegistrationSteps: Identifiable, Hashable {
    var id: Int { return self.rawValue  }

}
