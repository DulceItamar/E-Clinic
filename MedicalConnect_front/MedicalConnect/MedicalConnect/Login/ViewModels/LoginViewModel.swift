//
//  OnboardingManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/08/24.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var nextView: Bool = false
    
    let validations = OnbordingValidations()
    let client = EConnectAPIClient()
    
    
    
    
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
    
    
    
    @MainActor
    func login() {
    
        
        guard !isLoading else { return }
             
        isLoading = true
        errorMessage = nil
    
        
        Task {
            do {
                
                let loginRequest = LoginRequest(email: email, password: password)
                
                let response = try await LoginAction(
                    parameters: loginRequest
                ).call()
                
                let accessToken = response.data.accessToken
                let refreshToken = response.data.refreshToken
                
                try Auth.shared.setCredentials(
                    accessToken: accessToken,
                    refreshToken: refreshToken
                )
                
                if Auth.shared.loggedIn {
                    UserSession.shared.startSession(with: loginRequest)
                }
                
            } catch {
                print("Error loggin in: \(error)")
                
                
                errorMessage = "Fallo al entrar. Por favor intente de nuevo"
            }
            isLoading = false
        }
        
            

      
        
    }

}



