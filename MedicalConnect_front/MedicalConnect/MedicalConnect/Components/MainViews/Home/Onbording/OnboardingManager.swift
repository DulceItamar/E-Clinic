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

    
    let validations = OnbordingValidations()
    let client = EConnectAPIClient()
    
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


    
    func sendPatientInfo() async {
        do {
            let user = LoginUser(email: email, password: password)
            let result = try await client.sendData(endpoint: GetLoginUserData(query: [URLQueryItem(name: "email", value: email)]), object: user)
            
            switch result {
                case .success(let success):
                   let parser = Parser()
                    print(success)
                    let patientData = parser.parseReceiveData(success, type: LoginUser.self, decoder: JSONDecoder())
                    print(patientData as Any)
                case .failure(let failure):
                    print(failure)
            }
            
        } catch {
            print(error)
        }
        
        
    }
    
    
    func loginUser() async {
        
        do {
            let endpoint = GetLoginUserData(query: [URLQueryItem(name: "email", value: email)])
            let result = try await client.loginData(endpoint: endpoint)
            print(result)
        } catch {
            print(error.localizedDescription)
        }
        
       
        
        
    }
}

