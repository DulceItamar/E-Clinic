///`LoginViewModel` is a view model responsible for handling user login logic, including email and password validation sign-in actions (via email or Google), and view navigation.

import Foundation
import Combine
import GoogleSignIn
import FirebaseAuth
import Firebase
import FirebaseCore


///- Parameters:
/// - emal: Stores the email input from the user. Triggers UI update whenever the value changes.
/// - password: Stores the password input from the user. Triggers UI update whenever the value changes.
/// - isLoading: Indicates whether a loading process (e.g., login request) is currently in progress. When `true`, UI can display a loading indicator.
/// - errorMessage: Stores an error message if any error occurs during the login process.
class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    
    /// An instance of `OnbordingValidations` used for email and password validation.
    let validations = OnbordingValidations()
    
    
    /// A set of cancellable objects used to handle any Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    
    /// `emailFormatValidation` validates the email format. Uses the `isEmailValid(email:)` method from `OnbordingValidations` to check if the entered email is in the correct format.
    func emailFormatValidation() {
        _ = validations.isEmailValid(email: email)
        
    }
    
    
    ///`isEmailTextValidation` checks if the email input passes validation.
    /// - Returns: `true` if the email is valid, otherwise `false`.
    func isEmailTextValidation() -> Bool {
        let validsEmail = validations.isEmailValid(email: email)
        
        return validsEmail
        
    }
    
    
    ///`isPasswordTextValidation` checks if the password input passes validation.
    /// - Returns: `true` if the password is valid, otherwise `false`.
    func isPasswordTextValidation() -> Bool {
        let validsPassword = validations.isPasswordValid(password: password)
        
        return validsPassword
    }
    
    
    ///`passwordValidation` validates the password input using the `isPasswordValid(password:)` method from `OnbordingValidations`.
    func passwordValidation() {
        _ = validations.isPasswordValid(password: password)
    }
    
    
    ///`availableButton` determines whether the login button should be enabled based on the validity of both email and password.
    /// - Returns: `true` if both email and password are valid, otherwise `false`.
    func availableButton() -> Bool {
        let validPassword = validations.isPasswordValid(password: self.password)
        let validEmail = validations.isEmailValid(email: self.email)
        
        if (validEmail && validPassword) {
            return true
        } else {
            return false
        }
    }
    
    
    /// Asynchronously handles login with email and password. Calls the login API, stores credentials, and manages session.
    /// If an error occurs, sets the `errorMessage`.
    @MainActor
    func loginWithEmail() {
        
        // Prevents multiple simultaneous login attempts.
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        
        Task {
            do {
                // Create a login request using the provided email and password.
                let loginRequest = LoginRequest(email: email, password: password)
                
                
                // Perform the login action and await the result.
                let response = try await LoginAction(parameters: loginRequest).call()
                
                
                // Extract access and refresh tokens from the response.
               // guard let data = response.data else { return }
                let accessToken = response.data.accessToken
                let refreshToken = response.data.refreshToken
                
                
                // Store the credentials securely in the Keychain.
                try KeychainAccessAuth.shared.setCredentials(
                    accessToken: accessToken,
                    refreshToken: refreshToken
                )
                
                
                // Start the user session if the login was successful.
                if KeychainAccessAuth.shared.loggedIn {
                    UserSession.shared.startSessionEmail(with: response)
                }
            } catch {
                print("Error loggin in: \(error)")
                
                
                errorMessage = "Fallo al entrar. Por favor intente de nuevo"
            }
            
            isLoading = false // Stop loading after the task completes (success or failure).
        }
    }
    
    
    ///`loginWithGoogle` handles Google login. Uses a completion handler to signal success (`true`) or failure (`false`).
    /// - Parameter completion: A closure executed upon completion of the Google login process.
    func loginWithGoogle(completion: @escaping (Bool) -> Void) {
        self.isLoading = true
        
        
        GoogleHandlerViewModel.shared.googleSignIn {[weak self] result  in
            
            guard let self = self else {
                completion(false)
                return
            }
//
            
            self.isLoading = false
            
            
            switch result {
                case .success(let data):
                    guard let dataUser = data else {
                        completion(false)
                        return
                    }
                  
                    
                    // Set the user profile from Google authentication data.
                    GoogleHandlerViewModel.shared.googleUser = GoogleHandlerViewModel.shared.getUserProfileForSendToBackend(authData: dataUser)
                    completion(true)
                case .failure(let error):
                    self.isLoading = false
                    print("Error durante la autenticación: \(error.localizedDescription)")
                    completion(false)
            }
        }
    }
    
    
    ///`navigateToNextView` handles navigation to the next view based on the type of login (Google or Email).
    /// - Parameters:
    ///   - onboardingRouter: The object responsible for handling onboarding navigation.
    ///   - login: The type of authentication (Google or Email).
    func navigateToNextView(onboardingRouter: OnboardingRouter,  login: TypeOfAuth) {
        
        switch login {
            case .GoogleAuth:
                if GoogleHandlerViewModel.shared.loggedIn {
                    onboardingRouter.navigate(for: .signup(.generalForm(typeOfSignup: .GoogleAuth)))
                }
                
            case .EmailAuth:
                if KeychainAccessAuth.shared.loggedIn {
                    
                    onboardingRouter.navigate(for: .login(.home))
                    
                }
        }
    }
    
}



