//
//  PatientManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 01/08/24.
//

import Foundation
import Combine

class PatientManager: ObservableObject {
    
    @Published var patient: Patient
    @Published var existAllergies : Allergies = .no
    @Published var continueAccess: Bool = false
    
    let client = EConnectAPIClient()
    
    private var cancellables = Set<AnyCancellable>()
    init(
        patient: Patient = Patient(
            user: User(
                name: "",
                email: "",
                password: "",
                phone: "",
                typeOfUser: .patient
            ),
            photo: nil,
            birthdate: Date(),
            allergies: "",
            gender: .FEMALE
        )
    ) {
        self.patient = patient
        setupValidation()
    }
    
    
    
    
    final func setupValidation(){
        
        
        
        Publishers.CombineLatest3(
            $patient.map(\.user.phone),
            
            $patient.map(\.allergies),
            $existAllergies
            
            
            
        ).map({ phone, allergies, existAllergies in
            
            let phoneIsValid = !phone.isEmpty
            let allergiesIsValid = existAllergies == .yes  || (existAllergies == .no)
            return phoneIsValid && allergiesIsValid
            //  return !phone.isEmpty || !allergies.isEmpty
        })
        .assign(to: &$continueAccess)
        
    }
    
    
    final func saveUserDataInPatient(userData: User){
        patient.user = userData
        
        
        
    }
    
    func sendPatientInfo() async {
        do {
            
            try await client.sendData(endpoint: PostSignUpNewPatient(), object: patient)
        } catch {
            print(error)
        }
        
        
    }
}
