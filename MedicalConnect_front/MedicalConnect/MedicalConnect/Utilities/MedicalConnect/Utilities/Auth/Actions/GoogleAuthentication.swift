///`GoogleAuthentication` is a singleton class that manages Google sign-in and Firebase authentication.

import Foundation
import FirebaseAuth
import FirebaseCore
import Firebase
import SwiftUI
import GoogleSignIn



final class GoogleAuthentication {
    
    
    static let shared = GoogleAuthentication()
    
    
    ///`signUpWithGoogle` initiates the Google sign-in process. It configures the Google Sign-in SDK using the app's client ID and presentes the sign-in screen to the user. This method handles various errors
    ///- Parameters:
    ///   - completion: closure that is called after Google sign-in attempt. It returns either a `GIDGoogleUser?` upon success or a `GoogleSignInError` in case of an error.
    private func signUpWithGoogle(completion: @escaping (GIDGoogleUser?,GoogleSignInError?) -> Void ){
        
        //Retrieve app client id: Attempts to get the client ID from the Firebase configuration
        guard let clientId = FirebaseApp.app()?.options.clientID else {
            completion(nil, .clientIDNotFound)
            return
        }
        
        
        //Configuration Google sign-in: Creates a GIDConfiguration object using the client Id.
        let config = GIDConfiguration(clientID: clientId)
        
        
        
        //As you're not using view controllers to retrieve the presentingViewController, access it through thre shared instance  of the UIApplication
        //Get the root view controller : it retrieves the root view controller of the app to present the Google sign-in view
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let rootViewController = windowScene.windows.first?.rootViewController else {
            completion(nil, .viewControllerNotFound)
            return
        }
        
        
        
        //Starting the sign in flow
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            
            if let error = error {
                //Handle error of explicit cancel
                if (error as NSError).code == GIDSignInError.canceled.rawValue {
                    completion(nil, .signInCancelled)
                }
                completion(nil,error as? GoogleSignInError)
            }
            
            if let result = signInResult {
                completion(result.user, nil)
            } else {
                completion(nil, .signInFailed)
            }
        }
    }
    
    
    ///`authenticateUser` authenticates the sign-in Google user with Firebase using the ID and access Tokens provided by Google. It creates Firebase credentials using these tokens and attempts to sign in the user via Firebase Authentication.
    ///- Parameters:
    /// - user: A `GIDGoogleUser`object representing the user retrieved from Google Sign-in.
    /// - completion: A closure that returns a Result type. On success, it provides an `AuthDataResult?`, on failure, it returns a `GoogleSingError`
    private func authenticateUser(
        for user: GIDGoogleUser?,
        completion: @escaping (Result<AuthDataResult?,GoogleSignInError>) -> Void
    ){
        
        
        //Ensures that the GIDGoogleUser is valid. If not, it return the signInFailed error
        guard let user = user else {
            completion(.failure(GoogleSignInError.signInFailed))
            return
        }
        
        //Retrieve the id Token and Access Token from the user
        guard let idToken = user.idToken?.tokenString else {
            completion(.failure(GoogleSignInError.idTokenNotFound))
            print("Failed to obtain ID Token ")
            return
        }
        
        
        let accessToken = user.accessToken.tokenString
        
        
        //Create Firebase credentials: Uses tokens to generate a `GoogleAuthProvider.credential`
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
    
    
    ///`completeGoogleSignInHandler` starts by calling `signUpWithGoogle` to initiate the Google Sign-in process. If Google sing. in succeeds, it retrieves the user data (GIDGoogleUser). This user data is then passed to the `authenticateUser`function, which uses Firebase to authenticate the user with Google credentials.
    ///- Parameters:
    /// - completion: it is invoked with the result of this Firebase authentication
    ///- returns: On success, it returns an `AuthDataResult`containing the Firebase authentication data for the signe-in Google user. On failure it returns a `GoogleSignInError`
    func completeGoogleSignInHandler(completion: @escaping (Result<AuthDataResult?, GoogleSignInError>) -> Void) {
        
        //Call signUpWithGoogle function
        signUpWithGoogle { [unowned self ] user, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            
            //Check for valid user
            guard let user = user else {
                completion(.failure(.signInFailed))
                return
            }
            
            
            //Authenticate user with firebase
            authenticateUser(for: user) { authResult in
                completion(authResult)
            }
        }
    }
    
    
    ///`googleSignOut` signs out the currently authenticathed Google user from the app
    func googleSignOut() {
        
        
        //Calls GIDSignIn.sharedInstance.signOut() to log the user out from the Google session.
        GIDSignIn.sharedInstance.signOut()
    }
    
    
}

