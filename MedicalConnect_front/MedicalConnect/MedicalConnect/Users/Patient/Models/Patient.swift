///`Patient` is a struct representing a patient in a medical context. It conforms to Hashable, Identifiable, Decodable, and Encodable protocols, meaning that it can be used in collections requiring unique identification, serialized to/from JSON, and compared for equality.
///- Parameters:
/// - id: A unique identifier for each Patient instance, automatically generated using UUID(). This property is implicitly required by the Identifiable protocol.
/// - user: The User associated with this patient, containing basic user information such as name, email, password, and phone number.
/// - birthdate: The patient's date of birth.
/// - allergies: A description of any allergies the patient has.
/// - gender: The patient's gender.
/// - paymentMethods: An optional array of the patient's payment methods. Each payment method could be represented by a PaymentMethod type, which could include details like card number, card name, and expiration date.
import Foundation

struct Patient:Hashable, Identifiable {



  let id = UUID()
    var user : User
    
    
    var birthdate: Date
    var allergies: String
    var gender: Gender
    
    var paymentMethods: [PaymentMethod]?
    
    
    /// `UserCodingKeys`  defines the keys used for encoding/decoding the User part of the Patient struct.
    enum UserCodingKeys: String, CodingKey {
        case id
        case name
        case email
        case password
        case phone
        case typeUser = "type_of_user"
    }
    
    
    ///`PatientCodingKeys` This enum defines the keys used for encoding/decoding the Patient struct.
    enum PatientCodingKeys: String, CodingKey {
        case user
        
        case photo
        case birthdate
        case allergies
        case gender
        
        case paymentMethods = "payment_methods"
    }
}


/// The Patient struct conforms to both Decodable and Encodable protocols, allowing it to be easily serialized and deserialized.
extension Patient: Decodable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PatientCodingKeys.self)
      
        self.birthdate = try container.decode(Date.self, forKey: .birthdate)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.allergies = try container.decode(String.self, forKey: .allergies)
        
        let userContainer = try container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        
        self.user = User(
           
            name: try userContainer.decode(String.self, forKey: .name),
            email: try userContainer.decode(String.self, forKey: .email),
            password: try userContainer.decode(String.self, forKey: .password),
            phone: try userContainer.decode(String.self, forKey: .phone),
            typeOfUser: try userContainer.decode(TypeOfUsers.self, forKey: .typeUser)
        )
        
        
        self.paymentMethods = try container.decode([PaymentMethod]?.self,forKey: .paymentMethods)
    }
}


extension Patient: Encodable {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: PatientCodingKeys.self)
      
        try container.encode(birthdate, forKey: .birthdate)
        try container.encode(gender, forKey: .gender)
        try container.encode(allergies, forKey: .allergies)
        
        var userContainer = container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
      
        try userContainer.encode(user.name, forKey: .name)
        try userContainer.encode(user.email, forKey: .email)
        try userContainer.encode(user.password, forKey: .password)
        try userContainer.encode(user.phone, forKey: .phone)
        try userContainer.encode(user.typeOfUser, forKey: .typeUser)
        
        try container.encode(paymentMethods, forKey: .paymentMethods)
    }
}
