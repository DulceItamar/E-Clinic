/// The `LoginResponse` struct represents the response received from a login API request.
///
/// It contains a `LoginResponseData` object, which holds the authentication tokens. This struct conforms to the `Decodable` protocol, allowing it to be easily decoded from JSON.

/// - Parameters:
///     - data: The response data containing authentication tokens.


import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}



