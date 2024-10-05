///`GoogleHandlerViewModel` is responsable for handling the logic for Google Signin, managing user login states, and fetching user profile data.
///

import Foundation
import GoogleSignIn
import FirebaseAuth

final class GoogleHandlerViewModel: ObservableObject {
    ///`googleUser` stores the information of the authenticated google user. It's an optional variable that will be nil if no user is signed in.
    ///`logggedIn` indicates whether a user is logged in (true) or not (false)
    ///`googleAuth` is a singleton instance of the `GoogleAuthentication` class, used to perform sign-in and sign-out operations.
    @Published var googleUser: GoogleUserInformationModel? = nil
    @Published var loggedIn: Bool = false
    let googleAuth = GoogleAuthentication.shared
    static let shared = GoogleHandlerViewModel()
    
    
    ///The initializer checks if a user is already logged in when the class is initialized by calling the hasUserLoggedIn() method, setting the loggedIn property accordingly.
    init() {
        
        self.loggedIn = hasUserLoggedIn()
    }
    
    
    ///`googleSignIn` initiates the Google sign-in process through
    ///- Parameters:
    /// - completion: it is a closure that is called upon the completion of the Google sign-in process.
    ///- returns: It returns either a succes with `AuthDataResult?` or a failure with a `GoogleSigninError`
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
                
                    completion(.failure(error))
                
                    print("Error durante la autenticación: \(error.localizedDescription)")
            }
        }
    }
    
    
    ///`googleSignOut` signs out the current google user by calling googleAuth.googleSignOut() and resets the  `loggedIn` property to false
    func googleSignout() {
      
        self.loggedIn = false
        googleAuth.googleSignOut()
    }
    
    
   
    ///`getUserProfileForSendToBackend` extracts the user's profile information from the provided `authData`objetcct and creates a `GoogleUserInformationModel`. The `loggedIn`state is set to true if a valid user is found.
    ///- Parameters:
    ///  - authData: The authentication data returned from the google sig-in process.
    ///- returns: A `GoogleUserInformationModel` containing the user's profile information. returns nil if `authData is nil
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
    
    
    ///`hasUserLoggedIn` checks if a user us currently logged in by verifying whether googleUser is nil.
    ///- returns: If a user profile is available, it returns true otherwise it return false.
    func hasUserLoggedIn() -> Bool {
        return googleUser != nil
    }
}
