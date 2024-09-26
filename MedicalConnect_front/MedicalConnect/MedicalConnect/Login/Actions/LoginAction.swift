/// `LoginAction` is responsible for executing the login API call by sending user credentials and receiving a response.
/// It builds the required components such as scheme, host, and path, then calls a reusable `APIRequest` method to perform the actual request.
///
/// The struct uses asynchronous functionality to handle the login process.


import Foundation

struct LoginAction {
    /// - Parameters:
        /// - scheme: /// The URL scheme used for the request, retrieved from the app environment (e.g., "https").
        /// - host: The host (domain) of the API, retrieved from the app environment.
        /// - path: The endpoint path for the login request, pointing to the user login route.
        /// - method: The HTTP method to use for the request. This is a POST request in this case.
        /// - parameters: The parameters to be sent with the login request, containing the user credentials.
    let scheme = AppEnvironment.shared.getScheme(scheme: .https)
    let host = AppEnvironment.shared.getURL(api: .test)
    let path = "/patients/user"
    let method : HTTPMethod = .POST
    var parameters: LoginRequest
    
    
    /// `call` executes the login API request asynchronously and returns a `LoginResponse` object.
    /// - Returns: A `LoginResponse` object containing the result of the login operation.
    /// - Throws: An error if the request fails due to network issues or if the response cannot be decoded.
    func call() async throws -> LoginResponse {
        
        
       let response = try await APIRequest<LoginRequest, LoginResponse>
            .call(
            scheme: scheme,
            host: host,
            path: path,
            method: method,
            parameters: parameters
            )
        
        return response
    }
}
