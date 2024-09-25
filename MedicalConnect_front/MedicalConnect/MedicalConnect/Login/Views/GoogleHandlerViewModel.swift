//
//  GoogleHandlerViewModel.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 18/09/24.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

final class GoogleHandlerViewModel: ObservableObject {
    @Published var googleUser: GoogleUserInformationModel? = nil
    @Published var loggedIn: Bool = false
    let googleAuth = GoogleAuthentication.shared
    static let shared = GoogleHandlerViewModel()
    
    init() {
        
        self.loggedIn = hasUserLoggedIn()
    }
    
    func googleSignIn(completion: @escaping (Result<AuthDataResult?, GoogleSignInError>) -> Void ) {
        googleAuth.completeGoogleSignInHandler {  (result: Result<AuthDataResult?, GoogleSignInError>) in
            switch result {
                case .success(let authResult):
                    
                    guard let validResult = authResult else  {
                        completion(.failure(.userProfileNotFound))
                        return
                    }
                    
                    completion(.success(validResult))
                   
                case .failure(let error):
                    print("Error durante la autenticación: \(error.localizedDescription)")
            }
        }
    }
    
    func googleSignOut() {
      
        self.loggedIn = false
        googleAuth.googleSignOut()
    }
    
    func getUserProfileForSendToBackend(authData: AuthDataResult?) -> GoogleUserInformationModel? {
        guard let authData = authData else { return nil }
        
        let googleUser = authData.user
        
         
         let userData = GoogleUserInformationModel(
            name: googleUser.displayName,
            email: googleUser.email,
            phone: googleUser.phoneNumber
         )
       
        self.loggedIn = true
        
        return userData
           
    }
    
    func hasUserLoggedIn() -> Bool {
        return googleUser != nil
    }
}
