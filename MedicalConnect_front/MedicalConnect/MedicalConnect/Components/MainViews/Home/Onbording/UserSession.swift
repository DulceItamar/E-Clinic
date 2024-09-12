//
//  UserSession.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 06/09/24.
//

import Foundation

final class UserSession: ObservableObject {
    
    static let shared = UserSession()
    var currentUser: LoginRequest? = nil
   @Published var isLoggedIn: Bool = false
    
    private init() {}
    
    
    
    
    func startSession(with user: LoginRequest) {
        
        self.currentUser = user
        self.isLoggedIn = true
        
        print("User is correct: \(String(describing: currentUser?.email))")
    }
    
    func logout(){
        self.currentUser = nil
        self.isLoggedIn = false
    }
    
}
