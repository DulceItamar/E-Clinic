//
//  GoogleAuthentication.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 17/09/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import Firebase
import SwiftUI
import GoogleSignIn



final class GoogleAuthentication {
   
    
   
   static let shared = GoogleAuthentication()

   
//    func completeGoogleSignIn(completion: @escaping (Result<GIDGoogleUser?, GoogleSignInError>) -> Void) {
//        
//        
//        
//        //Start the sign in flow with Google
//        signUpWithGoogle { [unowned self ] result, error in
//         
// 
//            guard let result = result else { return }
//            
//            
//        }
//        
//        
////        signUpWithGoogle { [unowned self ] user, error in
////            guard let user = user else { return }
////            
////            if let error = error {
////                completion(nil, error)
////                return
////            }
////            
////            
////            //User authentication in Firebase
////            authenticateUser(for: user, with: error) { [self] authResult in
////                switch authResult {
////                    case .success( _):
////                        completion(authResult, error)
//////                        if let result = authResult {
//////                            completion(authResult, nil)
//////                        } else {
//////                            completion(nil, GoogleSignInError.signInFailed)
//////                        }
////                    case .failure(let error):
////                        completion(nil, error)
////                }
////            }
////        }
//        
//    }
    
    
    private func signUpWithGoogle(completion: @escaping (GIDGoogleUser?,GoogleSignInError?) -> Void ){
        
        //Get app client id
        guard let clientId = FirebaseApp.app()?.options.clientID else {
            completion(nil, .clientIDNotFound)
            return
        }
        
        //get Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientId)
        
        //As you're not using view controllers to retrieve the presentingViewController, access it through thre shared instance  of the UIApplication
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let rootViewController = windowScene.windows.first?.rootViewController else {
            completion(nil, .viewControllerNotFound)
            return
        }
        
        
        //Starting the sign in flow
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            
            if let error = error {
                completion(nil,error as? GoogleSignInError)
            }
            
            if let result = signInResult {
                completion(result.user, nil)
            } else {
                completion(nil, .signInFailed)
            }
        }
    }

    
    
    private func authenticateUser(
        for user: GIDGoogleUser?,
      
        completion: @escaping (Result<AuthDataResult?,GoogleSignInError>) -> Void
    ){
       

       
       guard let user = user else {
           completion(.failure(GoogleSignInError.signInFailed))
           return
       }
       
       //Obtain the id Token and Access Token from the user
       guard let idToken = user.idToken?.tokenString else {
           completion(.failure(GoogleSignInError.idTokenNotFound))
           print("Failed to obtain ID Token ")
           return
       }
       
       
       let accessToken = user.accessToken.tokenString
       
       //Use the tokens to create Firebase credentials
       let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
       
       
       Auth.auth().signIn(with: credential) { result, error in
           
          
           if let error = error {
               completion(.failure(.firebaseAuthenticationFailed))
               print("Error: \(error.localizedDescription)")
               return
           }
           
           
           completion(.success(result))
           print("Signed in with Google")
       }
       
   }
    
    
    func completeGoogleSignInHandler(completion: @escaping (Result<AuthDataResult?, GoogleSignInError>) -> Void) {
        
        signUpWithGoogle { [unowned self ] user, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = user else {
                completion(.failure(.signInFailed))
                return
            }
            
            authenticateUser(for: user) { authResult in
                completion(authResult)
            }
            
        }
        
    }
   
   
   func googleSignOut() {
       
       GIDSignIn.sharedInstance.signOut()
       print("Google sign out")
   }
   
  
}

