//
//  PatientAccountValidation.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 20/08/24.
//

import Foundation



final class PatientValidations {
    
    
    func isEmailValid(email: String) ->  Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za.z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
        print("Validation result:", emailPred)
        return emailPred
    }
    
    
    func isPasswordValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        
        return passwordPredicate
    }
    
}
