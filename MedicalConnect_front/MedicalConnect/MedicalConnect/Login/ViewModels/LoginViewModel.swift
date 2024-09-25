//
//  OnboardingManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/08/24.
//

import Foundation
import Combine
import GoogleSignIn
import FirebaseAuth
import Firebase
import FirebaseCore

 class LoginViewModel: ObservableObject {
     
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var nextView: Bool = false
     
  
    
    let validations = OnbordingValidations()
 //   let client = EConnectAPIClient()
    
    
    
    
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
        let validPassword = validations.isPasswordValid(password: self.password)
        let validEmail = validations.isEmailValid(email: self.email)
        
        if (validEmail && validPassword) {
            return true
        } else {
            return false
        }
    }
    
    
    
    @MainActor
    func loginWithEmail() {
        
        
        guard !isLoading else { return }
             
        isLoading = true
        errorMessage = nil
        
        
        Task {
            do {
                
                let loginRequest = LoginRequest(email: email, password: password)
                
                let response = try await LoginAction(parameters: loginRequest).call()
                

                
                let accessToken = response.data.accessToken
                let refreshToken = response.data.refreshToken
                
                try KeychainAccessAuth.shared.setCredentials(
                    accessToken: accessToken,
                    refreshToken: refreshToken
                )
                
                if KeychainAccessAuth.shared.loggedIn {
                    UserSession.shared.startSession(with: loginRequest)
                }
            } catch {
                print("Error loggin in: \(error)")
                
                
                errorMessage = "Fallo al entrar. Por favor intente de nuevo"
            }
            isLoading = false
        }
    }
    
     
     func loginWithGoogle(completion: @escaping (Bool) -> Void) {
         isLoading = true
         GoogleHandlerViewModel.shared.googleSignIn {[weak self] result  in
             
             guard let self = self else { return }
             
             self.isLoading = false
             switch result {
                 case .success(let data):
                     guard let dataUser = data else {
                         completion(false)
                         return
                     }
            
                     GoogleHandlerViewModel.shared.googleUser = GoogleHandlerViewModel.shared.getUserProfileForSendToBackend(authData: dataUser)
                     
                   print("Registro con google hecho")
                     completion(true)
                 case .failure(let error):
                     print("Error durante la autenticación: \(error.localizedDescription)")
                     completion(false)
             }
         }
     }
    
     func navigateToNextView(onboardingRouter: OnboardingRouter,  login: TypeOfAuth) {
         
         switch login {
             case .GoogleAuth:
                 if GoogleHandlerViewModel.shared.loggedIn {
                     onboardingRouter.navigate(for: .signup(.generalForm(typeOfSignup: .GoogleAuth)))
                 }
                 
             case .EmailAuth:
                 if KeychainAccessAuth.shared.loggedIn {
                     onboardingRouter.navigate(for: .login)
                     
                     print("Ingresando ...")
                 }
         }
     }
     
     
     func GoogleSignOut(){
         GoogleAuthentication.shared.googleSignOut()
     }
    
    
    func userProfileInfo (user: GoogleUserInformationModel?)  {
        guard let _ = user else { return }
        
    }
}



