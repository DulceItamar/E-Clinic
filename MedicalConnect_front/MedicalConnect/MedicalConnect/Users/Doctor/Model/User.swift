/// `UserProtocol` defines the essential properties required for a user in the system. It ensures that any conforming type provides the necessary user information and conforms to the Hashable protocol, allowing instances to be stored in collections like sets or used as dictionary keys.
import Foundation

protocol UserProtocol: Hashable {
    var name: String { get }
    var email: String { get }
    var password: String { get }
    var phone: String { get }
    var typeOfUser: TypeOfUsers { get }
}


/// A struct representing a user
/// `User` conforms to `UserProtocol`to provide all necessary user information and support hashing
struct User: UserProtocol {
 
    var name: String
    var email: String
    var password: String
    var phone: String
    var typeOfUser: TypeOfUsers
    
    
}
