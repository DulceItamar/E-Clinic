//
//  OnboardingManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/08/24.
//

import Foundation
import Combine

final class OnboardingManager: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValidEmail: Bool = false
    @Published var isValidPassword: Bool = false
    @Published var disableButton: Bool = false
    
    let validations = OnbordingValidations()
    
    @Published var nextView: Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    
    

    
    final func navigateToNextView() {
        nextView = true
    }
    
    func emailFormatValidation() {
        _ = validations.isEmailValid(email: email)
        
    }
    
    
    
    func isEmailTextValidation() -> Bool {
        let validsEmail = validations.isEmailValid(email: email)
        
        return validsEmail
        
    }
    
    func isPasswordTextValidation() -> Bool {
        let validsPassword = validations.isPasswordValid(password: password)
        
        return validsPassword
        
    }
    

    
    
    func passwordValidation() {
        _ = validations.isPasswordValid(password: password)
        

    }
    
    

    
    func availableButton() -> Bool {
        let validPassword = validations.isPasswordValid(password: password)
        let validEmail = validations.isEmailValid(email: email)
        
        if (validEmail && validPassword) {
            return true
        } else {
            return false
        }
    }
//        Publishers.CombineLatest(
//            $isValidEmail, $isValidPassword).map { isValidEmail, isValidPassword in
//                
//            return isValidEmail && isValidPassword
//            }
//            .assign(to: \.disableButton, on: self)
//            .store(in: &cancellables)
//
//    }
    
}

