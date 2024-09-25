/// `KeychainAccessAuth` is a class that manages user authentication by interacting with the keychain to store, retrieve, and manage credentials.
///

import Foundation
import KeychainAccess

class KeychainAccessAuth: ObservableObject {
    
    /// `Credentials`struct hold the access token and refresh token for user authentication.
    /// - Parameters:
    ///  - refreshToken:The refresh token for renewing access when it expires.
    ///  - accessToken:The access token for authenticated requests.
    struct Credentials {
        var accessToken: String?
        var refreshToken: String?
    }
    
    
    ///`KeychainKey` is a enumeration that defines the keys used to store and retrieve data from the keychain.
    /// The raw values represent the specific keychain keys for access token and refresh token.
    enum KeychainKey: String {
        case accessToken
        case refreshToken
    }
    
    
    static let shared: KeychainAccessAuth = KeychainAccessAuth()
    
    
    ///`keychainManager` is an instance of `Keychain`, which is responsible for interacting with the keychain.
    /// The `Keychain` is initialized with the service name associated with the app.
    private let keychainManager = Keychain(service: "com.DuleVigueras.MedicalConnect")
    
    
    /// `loggedIn` is a published property indicating whether the user is logged in or not.
    @Published var loggedIn: Bool = false
    
    
    ///Initializes the `loggedIn` state based on the presence of an access token.
    private init() {
        self.loggedIn = hasAccessToken()
    }
    
    
    ///`getCredentials` stored credentials (access token and refresh token) from the keychain.///
    /// - Throws: An error if there is a problem retrieving the credentials from the keychain.
    /// - Returns: A `Credentials` object containing the access token and refresh token, or `nil` values if they do not exist.
    func getCredentials() throws -> Credentials {
        var accessToken: String? = ""
        var refreshToken: String? = ""
        
        
        do {
             accessToken = try keychainManager.get(KeychainKey.accessToken.rawValue)
        
             refreshToken = try keychainManager.get(KeychainKey.refreshToken.rawValue)
        
        } catch let error {
            print("Error to get credentials: \(error) ")
        }
        return Credentials(accessToken: accessToken, refreshToken: refreshToken)
    }
    
    
    /// `setCredentials` stores the given access token and refresh token in the keychain.
    /// - Parameters:
    ///   - accessToken: The access token to store.
    ///   - refreshToken: The refresh token to store.
    /// - Throws: An error if there is a problem saving the tokens to the keychain.
    func setCredentials(accessToken: String, refreshToken: String) throws {
        
        do {
            //access Token
            try keychainManager.set(accessToken, key: KeychainKey.accessToken.rawValue)
            
            //refresh Token
            try keychainManager.set(refreshToken, key: KeychainKey.refreshToken.rawValue)
            
        } catch let error {
            print("Error to set keychain: \(error)")
        }
        
        // Set the loggedIn state to true since credentials are now saved.
        loggedIn = true
    }
    
    
    ///`hasAccessToken` checks if there is an access token stored in the keychain.
    /// - Returns: A boolean value indicating whether an access token exists.
    func hasAccessToken()  -> Bool {
        return (try? getCredentials().accessToken) != nil
    }
    
    
    ///`getAccessToken` retrieves the access token from the keychain.
    ///- Throws: An error if there is an issue retrieving the access token.
    ///- Returns: The stored access token, or `nil` if it does not exist.
    func getAccessToken()  throws -> String? {
        return try getCredentials().accessToken
    }
    
    
    ///`getRefreshToken` retrieves the refresh token from the keychain.
    /// - Throws: An error if there is an issue retrieving the refresh token.
    /// - Returns: The stored refresh token, or `nil` if it does not exist.
    func getRefreshToken() throws -> String? {
        return try getCredentials().refreshToken
    }
    
    
    ///`logout` logs the user out by removing the access token and refresh token from the keychain.
    ///This method also updates the `loggedIn` state to false.
    func logout() {
        do {
            try keychainManager.remove(KeychainKey.accessToken.rawValue)
            try keychainManager.remove(KeychainKey.refreshToken.rawValue)
        
        } catch let error {
            print("Error: \(error)")
        }
        
        loggedIn = false
    }
    
}
