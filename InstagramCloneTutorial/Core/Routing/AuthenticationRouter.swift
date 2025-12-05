//
//  AuthenticationRouter.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 17.11.25.
//

import Foundation

@Observable
class AuthenticationRouter {
    var navigationPath = [RegistrationSteps]()
    
    @ObservationIgnored private(set) var currentStep: RegistrationSteps?
    
    func startRegistration() {
        guard let initialStep = RegistrationSteps(rawValue: 0) else {return }
        navigationPath.append(initialStep)
    }
    
    func navigate() {
        self.currentStep = navigationPath.last
        
        guard let index = currentStep?.rawValue else { return }
        guard let nextStep = RegistrationSteps(rawValue: index + 1) else { return }
        
        navigationPath.append(nextStep)
    }
    
    func reset() {
        navigationPath.removeAll()
        currentStep = nil
    }
}


