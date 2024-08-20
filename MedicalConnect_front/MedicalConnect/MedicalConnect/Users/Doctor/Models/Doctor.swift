//
//  Doctors.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import Foundation

struct Doctor: Hashable, Identifiable {
    var id: UUID = UUID()
    
    var user : User
    var medicalSpeciality: MedicalSpeality
    var professionalLicense: String
    var jobDescription: String
    
    var workDays:[WorkDays]
    var services: [String]
    
    var servicePrice: Float
    var evaluationData: DoctorEvaluationData
    
    
    
    
    
    enum UserCodingKeys: String, CodingKey {
        case id
        case name
        case email
        case password
        case phone
        case typeUser = "type_of_user"
    }
    
    
    enum DoctorCodingKeys: String, CodingKey {
        case user
        case medicalSpeciality = "medical_speciality"
        case professionalLicense = "professional_license"
        case jobDescription = "job_description"
        case workDays
        case services
        case servicePrice = "service_price"
        case evaluationData = "evaluation_data"
    }
    
    
//    enum evaluationDataCodingKeys: String, CodingKey {
//        case averageOfEvaluations = "average_of_evaluations"
//        case numberOfConsults = "number_of_consults"
//        case reviews
//    }
}



extension Doctor: Decodable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: DoctorCodingKeys.self)
        
        self.medicalSpeciality = try container.decode(MedicalSpeality.self, forKey: .medicalSpeciality)
        self.professionalLicense = try container.decode(String.self, forKey: .professionalLicense)
        self.jobDescription = try container.decode(String.self, forKey: .jobDescription)
        self.workDays = try container.decode([WorkDays].self, forKey: .workDays)
        self.services = try container.decode([String].self, forKey: .services)
        self.servicePrice = try container.decode(Float.self, forKey: .servicePrice)
        
        let userContainer = try container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        self.user = User(
            id: try userContainer.decode(UUID.self, forKey: .id),
            name: try userContainer.decode(String.self, forKey: .name),
            email: try userContainer.decode(String.self, forKey: .email),
            password: try userContainer.decode(String.self, forKey: .password),
            phone: try userContainer.decode(String.self, forKey: .phone),
            typeOfUser: try userContainer.decode(TypeOfUsers.self, forKey: .typeUser)
        )
        
        self.evaluationData = try container.decode(DoctorEvaluationData.self, forKey: .evaluationData)
        
//        let evaluationDoctorContainer  = try container.nestedContainer(keyedBy: evaluationDataCodingKeys.self, forKey: .evaluationData)
        
       
        
//        self.evaluationData = DoctorEvaluationData(
//            averageOfEvaluations: try evaluationDoctorContainer.decode(Float.self, forKey: .averageOfEvaluations),
//            numberOfConsults: try evaluationDoctorContainer.decode(Int.self, forKey: .numberOfConsults),
//            reviews: try evaluationDoctorContainer.decode([Review].self, forKey: .reviews)
//        )
    }
}


extension Doctor: Encodable {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: DoctorCodingKeys.self)
        try container.encode(medicalSpeciality, forKey: .medicalSpeciality)
        try container.encode(professionalLicense, forKey: .professionalLicense)
        try container.encode(jobDescription, forKey: .jobDescription)
        try container.encode(workDays, forKey: .workDays)
        try container.encode(services, forKey: .services)
        try container.encode(servicePrice, forKey: .servicePrice)
        
        var userContainer = container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        try userContainer.encode(user.id, forKey: .id)
        try userContainer.encode(user.name, forKey: .name)
        try userContainer.encode(user.email, forKey: .email)
        try userContainer.encode(user.password, forKey: .password)
        try userContainer.encode(user.phone, forKey: .phone)
        try userContainer.encode(user.typeOfUser, forKey: .typeUser)
        
        try container.encode(evaluationData, forKey: .evaluationData)
    }
}
