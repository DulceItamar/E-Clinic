/// The `LoginResponse` struct represents the response received from a login API request.
///
/// It contains a `LoginResponseData` object, which holds the authentication tokens. This struct conforms to the `Decodable` protocol, allowing it to be easily decoded from JSON.

/// - Parameters:
///     - data: The response data containing authentication tokens.


import Foundation

struct LoginResponse : Decodable {

    let data: LoginResponseData
   
}

//extension LoginResponse : Decodable {
//    init(from decoder: any Decoder) throws {
//       
//        let container = try decoder.container(keyedBy: CodingKeys.self)
////        self.success = try container.decode(Bool.self, forKey: .success)
//        self.data = try container.decodeIfPresent(AuthData.self, forKey: .data)
//        self.results = try container.decodeIfPresent(Patient.self, forKey: .results)
//        
//    }
//}


