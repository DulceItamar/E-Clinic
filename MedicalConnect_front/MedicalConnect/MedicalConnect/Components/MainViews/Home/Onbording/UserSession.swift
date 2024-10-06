//
//  UserSession.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 06/09/24.
//

import Foundation
import Combine


final class UserSession: ObservableObject {
    
    static let shared = UserSession()
    @Published var currentUser: GetPatientData? = nil
   @Published var isLoggedIn: Bool = false
    @Published var authMethod: TypeOfAuth? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    private let googleAuth = GoogleHandlerViewModel.shared
    private let emailAuth = KeychainAccessAuth.shared
    
    private init() {
        
        setupAuthenticationObservers()
        
        if self.isLoggedIn {
            loadData()
        }
    }
    
    
    
    func startSessionWithGoogle(){
        
    }
    
    
    func startSessionEmail(with response: LoginResponse?) {
        
        guard let response = response else { return }
        
        
        self.currentUser = response.data.user
        self.isLoggedIn = true
        
        saveData(data: response.data.user)
       
      //  print("User is correct: \(String(describing: currentUser?.user.email))")
    }
    
    
    
    func logout(){
        
        switch authMethod {
            case .GoogleAuth:
                googleAuth.googleSignout()
            case .EmailAuth:
                emailAuth.logout()
            case .none:
                break
        }
        
        self.currentUser = nil
        self.isLoggedIn = false
        self.authMethod = nil
        
        removeDataUserOfUserDefaults()
    }
    
    
    
    private func setupAuthenticationObservers(){
        
        Publishers.CombineLatest(emailAuth.$loggedIn, googleAuth.$loggedIn)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] emailLoggedIn, googleLoggedIn in
                guard let self = self else { return }
                
                self.isLoggedIn = emailLoggedIn || googleLoggedIn
                
                if emailLoggedIn {
                    self.authMethod = .EmailAuth
                } else if googleLoggedIn {
                    self.authMethod = .GoogleAuth
                } else {
                    self.authMethod = nil
                    self.currentUser = nil
                }
            }
            .store(in: &cancellables)
            
    }
    
    
    
    private func saveData(data: GetPatientData?) {
        guard let data = data else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data.id, forKey: "userId")
        userDefaults.set(data.gender.rawValue, forKey: "userGender")
        userDefaults.set(data.birthdate, forKey: "userBirthdate")
        userDefaults.set(data.allergies, forKey: "userAllergies")
        
        
        userDefaults.set(data.user.name, forKey: "userName")
        userDefaults.set(data.user.email, forKey: "userEmail")
        userDefaults.set(data.user.phone, forKey: "userPhone")
        userDefaults.set(data.user.password, forKey: "userPassword")
        userDefaults.set(data.user.typeOfUser.rawValue, forKey: "typeOfUser")
        

        userDefaults.set(data.user.typeOfSignup?.rawValue, forKey: "userTypeOfSignup")
        

    }
    
    
    
    private func removeDataUserOfUserDefaults() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "userId")
        userDefaults.removeObject(forKey: "userGender")
        userDefaults.removeObject(forKey: "userBirthdate")
        userDefaults.removeObject(forKey: "userAllergies")
        userDefaults.removeObject(forKey: "userName")
        userDefaults.removeObject(forKey: "userEmail")
        userDefaults.removeObject(forKey: "typeOfUser")
        userDefaults.removeObject(forKey: "userPhone")
        userDefaults.removeObject(forKey: "userPassword")
        userDefaults.removeObject(forKey: "typeOfUser")


    }
    
    private func loadData() {
        let userDefaults = UserDefaults.standard
        guard let userId = userDefaults.string(forKey: "userId"),
              let userGenderRaw = userDefaults.string(forKey: "userGender"),
              let userGender = Gender(rawValue: userGenderRaw),
              let userBirthdate = userDefaults.string(forKey: "userBirthdate"),
              let userAllergies = userDefaults.string(forKey: "userAllergies"),
              let userName = userDefaults.string(forKey: "userName"),
              let userEmail = userDefaults.string(forKey: "userEmail"),
              let userPhone = userDefaults.string(forKey: "userPhone"),
              let userPassword = userDefaults.string(forKey: "userPassword"),
              let typeOfUserRaw = userDefaults.string(forKey: "typeOfUser"),
              let typeOfUser = TypeOfUsers(rawValue: typeOfUserRaw) else {
            return
        }
        
        let user = GetUser(
            name: userName,
            email: userEmail,
            password: userPassword,
            phone: userPhone,
            typeOfUser: typeOfUser
        )
  
        
        self.currentUser = GetPatientData(
            id: userId,
            birthdate: userBirthdate,
            allergies: userAllergies,
            gender: userGender,
            paymentMethods: nil,
            user: user
        )
    }
}
