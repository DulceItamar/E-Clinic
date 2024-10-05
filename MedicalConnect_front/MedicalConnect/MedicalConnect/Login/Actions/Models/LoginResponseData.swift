/// The `LoginResponseData` struct represents the authentication token received from an API.
///
/// It contains the access token and the refresh token needed for authentication.
///
/// - Parameters:
///     - accessToken: A token used to authenticate requests.-
///     - refreshToken: A token used to refresh the access token.


import Foundation

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
    let user: GetPatientData
    
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_Token"
        case refreshToken = "refresh_Token"
        case user
    }
    
}
