//
//  UserSession.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 06/09/24.
//

import Foundation

final class UserSession {
    
    static let shared = UserSession()
    var currentUser: LoginUser? = nil
    var isLoggedIn: Bool = false
    
    private init() {}
    
    func updateSession(with user: LoginUser) {
        
        self.currentUser = user
        self.isLoggedIn = true
        
        print("User is correct: \(String(describing: currentUser?.email))")
    }
    
    func logout(){
        self.currentUser = nil
        self.isLoggedIn = false
    }
    
}
