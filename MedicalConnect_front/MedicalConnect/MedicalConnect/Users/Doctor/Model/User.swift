/// `UserProtocol` defines the essential properties required for a user in the system. It ensures that any conforming type provides the necessary user information and conforms to the Hashable protocol, allowing instances to be stored in collections like sets or used as dictionary keys.
import Foundation

protocol UserProtocol: Hashable {
    var name: String { get }
    var email: String { get }
    var password: String { get }
    var phone: String { get }
    var typeOfUser: TypeOfUsers { get }
    var typeOfSignup : TypeOfAuth? { get }
}


/// A struct representing a user
/// `User` conforms to `UserProtocol`to provide all necessary user information and support hashing
struct User: UserProtocol, Encodable {
 
    var name: String
    var email: String
    var password: String
    var phone: String
    var typeOfUser: TypeOfUsers
    var typeOfSignup : TypeOfAuth?
    
    /// `UserCodingKeys`  defines the keys used for encoding/decoding the User part of the Patient struct.


}
//extension User: Decodable {
//
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: UserCodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.email = try container.decode(String.self, forKey: .email)
//        self.password = try container.decode(String.self, forKey: .password)
//        self.phone = try container.decode(String.self, forKey: .phone)
//        self.typeOfUser = try container.decode(TypeOfUsers.self, forKey: .typeUser)
//        self.typeOfSignup = try container.decodeIfPresent(TypeOfAuth.self, forKey: .typeOfSignup)
//    }
//}

//extension User: Encodable {
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: UserCodingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(email, forKey: .email)
//
//       try container.encode(password, forKey: .password)
//       try container.encode(phone, forKey: .phone)
//       try container.encode(typeOfUser, forKey: .typeUser)
//       try container.encodeIfPresent(typeOfSignup, forKey: .typeOfSignup)
//    }
//
//}


