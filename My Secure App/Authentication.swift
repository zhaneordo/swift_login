//
//  Authentication.swift
//  MySecureApp
//
//  Created by Zhaneordo on 1/29/22.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Error with log in, please try again.", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
