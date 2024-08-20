//
//  OnbordingValidations.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 31/07/24.
//

import Foundation

class OnbordingValidations: ObservableObject {
    
    @Published var disableButton: Bool = true
    @Published var isValidEmail: Bool = true
    @Published var emailValidationMessage: String = ""
    
    func validationEmaiUser(email: String){
        
     
        
        func validationEmaiUser(email: String) {
            if email.contains("@") && email.contains(".") {
                isValidEmail = true
                emailValidationMessage = "Valid email"
            } else {
                isValidEmail = false
                emailValidationMessage = "Invalid email"
            }
        }
        
        
        
        
        
    }
    
}
