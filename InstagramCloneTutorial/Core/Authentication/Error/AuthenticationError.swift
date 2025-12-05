//
//  AuthenticationError.swift
//  InstagramCloneTutorial
//
//  Created by Denis Makarau on 27.11.25.
//

import Foundation

enum AuthenticationError: Error {
    case userDisabled
    case emailAlreadyInUse
    case invalidEmail
    case wrongPassword
    case userNotFound
    case networkError
    case credentialAlreadyInUse
    case weakPassword
    case unknownError
    case invalidCredential
    case tooManyRequests
    
    init(rawValue: Int) {
        switch rawValue {
        case 17004: self = .invalidCredential  // Modern Firebase: wrong password/email combo
        case 17005: self = .userDisabled
        case 17007: self = .emailAlreadyInUse
        case 17008: self = .invalidEmail
        case 17009: self = .wrongPassword      // Legacy: specifically wrong password
        case 17010: self = .tooManyRequests
        case 17011: self = .userNotFound
        case 17020: self = .networkError
        case 17025: self = .credentialAlreadyInUse
        case 17026: self = .weakPassword
        default: self = .unknownError
        }
    }
}

extension AuthenticationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .userDisabled:
            return "Your account has been disabled. Please contact support for assistance."
        case .emailAlreadyInUse:
            return "The email address is already in use by another account."
        case .invalidEmail:
            return "The email address is badly formatted."
        case .wrongPassword:
            return "The email or password is incorrect. Please try again."
        case .userNotFound:
            return "There is no user record corresponding to this identifier."
        case .networkError:
            return "A network error has occurred. Please try again."
        case .credentialAlreadyInUse:
            return "This credential is already associated with a different user account."
        case .weakPassword:
            return "The password must be 6 characters long or more."
        case .tooManyRequests:
            return "We have blocked all requests from this device due to unusual activity. Try again later."
        case .invalidCredential:
            return "The email or password is incorrect. Please try again."
        case .unknownError:
            return "An unknown error occurred. Please try again."
        }
    }
}
