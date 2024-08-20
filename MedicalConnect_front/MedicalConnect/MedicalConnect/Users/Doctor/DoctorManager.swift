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
                        ), servicePrice: 0.00)
    ) {
        self.doctor = doctor
        setupValidation()
    }
    
    
    
    
    final func setupValidation(){
        
        
        
        Publishers.CombineLatest3(
            $doctor.map(\.user.phone),
            $doctor.map(\.professionalLicense),
            $doctor.map(\.services)

        ).map({ phone, professionalLicense, services in
            
           
            return !phone.isEmpty && !professionalLicense.isEmpty && !services.isEmpty
        })
        .assign(to: &$continueAccess)
        
    }
    
    
    final func saveUserDataInDoctor(userData: User){
        doctor.user = userData
    }
    
    
    final func saveToServiceArray(service: String){
        doctor.services.append(service)
        //doctorServices.append(service)
    }
}
