///`Doctor` represents a medical professional within the MedicalConnect application. It encapsulates various attributes related to a doctor's profile, including personal information, professional details, work schedule, services offered, pricing, and evaluation data. The struct conforms to the Hashable and Identifiable protocols, enabling it to be used effectively within SwiftUI views and collections. Additionally, it conforms to the Decodable and Encodable protocols through extensions, facilitating seamless JSON encoding and decoding for data persistence and network communication.
/// - Parameters:
///    - id: A unique identifier for each Doctor instance. Automatically generated upon initialization.
///    - user: Encapsulates personal information about the doctor, such as name, email, password, phone number, and user type.
///    - medicalSpeciality: Represents the doctor's area of specialization within the medical field.
///    - professionalLicense: Stores the doctor's professional license number or identifier.
///    - jobDescription: Provides a description of the doctor's role, responsibilities, and areas of expertise.
///    - workDays: Lists the days of the week the doctor is available to work.
///    - services: Enumerates the services offered by the doctor, such as consultations, specific medical procedures, etc.
///    - servicePrice: Indicates the price charged by the doctor for their services.
///    - evaluationData: Contains data related to the doctor's evaluations, such as average ratings, number of consultations, and reviews.

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
    
    
    ///`UserCodingKeys` defines the mapping between the JSON keys and the User struct's properties during decoding and encoding processes.
    enum UserCodingKeys: String, CodingKey {
        case id
        case name
        case email
        case password
        case phone
        case typeUser = "type_of_user"
    }
    
    
    ///`DoctorCodingKeys` defines the mapping between the JSON keys and the Doctor struct's properties during decoding and encoding processes.
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
}


///Allows the Doctor struct to be initialized from external representations like JSON.
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
            
            name: try userContainer.decode(String.self, forKey: .name),
            email: try userContainer.decode(String.self, forKey: .email),
            password: try userContainer.decode(String.self, forKey: .password),
            phone: try userContainer.decode(String.self, forKey: .phone),
            typeOfUser: try userContainer.decode(TypeOfUsers.self, forKey: .typeUser)
        )
        
        self.evaluationData = try container.decode(DoctorEvaluationData.self, forKey: .evaluationData)
        
    }
}


///Allows the Doctor struct to be converted into an external representation like JSON.
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
    
        try userContainer.encode(user.name, forKey: .name)
        try userContainer.encode(user.email, forKey: .email)
        try userContainer.encode(user.password, forKey: .password)
        try userContainer.encode(user.phone, forKey: .phone)
        try userContainer.encode(user.typeOfUser, forKey: .typeUser)
        
        
        try container.encode(evaluationData, forKey: .evaluationData)
    }
}
