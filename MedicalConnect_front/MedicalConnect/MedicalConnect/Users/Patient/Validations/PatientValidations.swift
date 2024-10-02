//
//  PatientAccountValidation.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 20/08/24.
///`PatientValidations` is responsible for providing validation methods related to patient data input. This class includes functions to validate the format of email addresses and the strength of passwords according to predefined criteria. It uses regular expressions to check the validity of the input data.

import Foundation



final class PatientValidations {
    
    ///`isEmailValid` validates the format of the provided email address using a regular expression.
    ///- Parameters:
    /// - email: A String representing the email address to be validated.
    ///- returns:  A Bool indicating whether the email address is valid (true) or not (false).
    func isEmailValid(email: String) ->  Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za.z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
        print("Validation result:", emailPred)
        return emailPred
    }
    
    
    ///`isPasswordValid` Validates the strength of the provided password based on specific criteria using a regular expression. The password must contain at least one letter, one digit, and be at least eight characters long.
    ///- Parameters:
    /// - password: A String representing the password to be validated.
    ///- returns:  A Bool indicating whether the password is valid (true) or not (false).
    func isPasswordValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        
        return passwordPredicate
    }
    
}
