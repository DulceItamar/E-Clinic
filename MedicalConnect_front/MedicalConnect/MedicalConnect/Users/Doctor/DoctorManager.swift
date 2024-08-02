//
//  DoctorManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 01/08/24.
//

import Foundation
import Combine
class DoctorManager: ObservableObject {
    
    @Published var doctor: Doctor
    
    @Published var continueAccess: Bool = false
    
    @Published var addingServiceLabels: String = ""
    
    
    private var cancellables = Set<AnyCancellable>()
    init(
        doctor: Doctor = Doctor(
                        user:User(
                            name: "",
                            email: "",
                            password: "",
                            phone: "",
                            typeOfUser: .doctor
                        ),
                        medicalSpeciality: .gynecology,
                        professionalLicense: "",
                        jobDescription: "",
                        workDays: [.monday, .wednesday, .saturday],
                        services: [""],
                        evaluationData: DoctorEvaluationData(
                            averageOfEvaluations: 0.0,
                            numberOfConsults: 0,
                            reviews: [Review(
                                name: "E-Connect",
                                evaluation: 0,
                                reviewDescription: "Aún no tiene evaluaciones"
                            )]
        ))
    ) {
        self.doctor = doctor
        setupValidation()
    }
    
    
    
    
    final func setupValidation(){
        
        
        
        Publishers.CombineLatest(
            $doctor.map(\.user.phone),
            $doctor.map(\.professionalLicense)

        ).map({ phone, professionalLicense in
            
           
            return !phone.isEmpty && !professionalLicense.isEmpty
        })
        .assign(to: &$continueAccess)
        
    }
    
    
    final func saveUserDataInDoctor(userData: User){
        doctor.user = userData
    }
}
