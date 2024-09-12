//
//  Auth.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/09/24.
//

import Foundation
import KeychainAccess

class Auth: ObservableObject {
    
    struct Credentials {
        var accessToken: String?
        var refreshToken: String?
    }
    
    enum KeychainKey: String {
        case accessToken
        case refreshToken
    }
    
    static let shared: Auth = Auth()
    private let keychainManager = Keychain(service: "com.DuleVigueras.MedicalConnect")
    
    @Published var loggedIn: Bool = false
    
    private init() {
        self.loggedIn = hasAccessToken()
    }
    
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
    
    
    func setCredentials(accessToken: String, refreshToken: String) throws {
        
        do {
            //access Token
            try keychainManager.set(accessToken, key: KeychainKey.accessToken.rawValue)
            
            //refresh Token
            try keychainManager.set(refreshToken, key: KeychainKey.refreshToken.rawValue)
            
        } catch let error {
            print("Error to set keychain: \(error)")
        }
        
        loggedIn = true
    }
    
    func hasAccessToken()  -> Bool {
        
 
        
        return (try? getCredentials().accessToken) != nil
    }
    
    
    func getAccessToken()  throws -> String? {
        return try getCredentials().accessToken
    }
    
    func getRefreshToken() throws -> String? {
        return try getCredentials().refreshToken
    }
    
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
