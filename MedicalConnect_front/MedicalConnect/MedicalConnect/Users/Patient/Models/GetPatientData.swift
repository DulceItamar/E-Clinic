//
//  GetPatientData.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 04/10/24.
//

import Foundation

struct GetUser: UserProtocol {
    var name: String
    var email: String
    var password: String
    var phone: String
    var typeOfUser: TypeOfUsers
    var typeOfSignup: TypeOfAuth?
}


extension GetUser: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case password
        case phone
        case typeOfUser = "type_of_user"
        case typeOfSignup = "type_of_signup"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.typeOfUser = try container.decode(TypeOfUsers.self, forKey: .typeOfUser)
        self.typeOfSignup = try container.decodeIfPresent(TypeOfAuth.self, forKey: .typeOfSignup)
    }
}

struct GetPatientData: Hashable, Identifiable  {

    var id:  String
    var birthdate: String
    var allergies: String
    var gender: Gender
    var paymentMethods : [GetPaymentMethod]?
    var user: GetUser

}


extension GetPatientData: Decodable {
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case birthdate
        case allergies
        case gender
        case payment = "payment_methods"
        case user

    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)

        self.birthdate = try container.decode(String.self, forKey: .birthdate)
        self.allergies = try container.decode(String.self, forKey: .allergies)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.paymentMethods = try container.decodeIfPresent([GetPaymentMethod].self, forKey: .payment)
        self.user = try container.decode(GetUser.self, forKey: .user)
    }
    
}


struct GetPaymentMethod: Hashable, Identifiable, Decodable {
    var id : String?
    var name: String?
    var cardNumber: String?
    var expiredDate: String?
    var cvv: String?
    
    
    enum CodingKeys: String,  CodingKey {
        case id
        case name
        case cardNumber = "card_number"
        case expiredDate = "expired_date"
        case cvv
    }
}

