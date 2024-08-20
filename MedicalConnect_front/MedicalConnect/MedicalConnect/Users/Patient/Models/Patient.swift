//
//  Patient.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import Foundation

struct Patient:Hashable, Identifiable {

    let id = UUID()
    var user : User
    
    var photo: URL?
    var birthdate: Date
    var allergies: String
    var gender: Gender
    
    var paymentMethods: [PaymentMethod]?
    
    
    enum UserCodingKeys: String, CodingKey {
        case id
        case name
        case email
        case password
        case phone
        case typeUser = "type_of_user"
    }
    
    enum PatientCodingKeys: String, CodingKey {
        case user
        
        case photo
        case birthdate
        case allergies
        case gender
        
        case paymentMethods = "payment_methods"
    }
    
//    enum PaymentCodingKeys: String, CodingKey {
//        case cardName = "card_name"
//        case cardNumber = "card_number"
//        case expiredDate = "expired_date"
//    }

}

extension Patient: Decodable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PatientCodingKeys.self)
        self.photo = try container.decode(URL?.self, forKey: .photo)
        self.birthdate = try container.decode(Date.self, forKey: .birthdate)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.allergies = try container.decode(String.self, forKey: .allergies)
        
        let userContainer = try container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        
        self.user = User(
            id: try userContainer.decode(UUID.self, forKey: .id),
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
        try container.encode(photo, forKey: .photo)
        try container.encode(birthdate, forKey: .birthdate)
        try container.encode(gender, forKey: .gender)
        try container.encode(allergies, forKey: .allergies)
        
        var userContainer = container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        try userContainer.encode(user.id, forKey: .id)
        try userContainer.encode(user.name, forKey: .name)
        try userContainer.encode(user.email, forKey: .email)
        try userContainer.encode(user.password, forKey: .password)
        try userContainer.encode(user.phone, forKey: .phone)
        try userContainer.encode(user.typeOfUser, forKey: .typeUser)
        
        try container.encode(paymentMethods, forKey: .paymentMethods)
    }
}
