/// The `LoginRequest` struct represents a model used for sending login data (email and password) to an API.
///
/// This model conforms to the `Encodable` protocol, allowing it to be aeasily encodedto a format suitable for network transmission, such as JSON.

///- Parameters:
/// - email: The user's email address required for login
/// - password: The user's password required for authentication

import Foundation


struct LoginRequest : Encodable {
    let email: String
    let password: String
    

}
