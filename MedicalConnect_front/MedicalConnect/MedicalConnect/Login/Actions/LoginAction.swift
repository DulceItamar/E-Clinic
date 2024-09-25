/// The `LoginAction` struct is responsable for building a URL using given components, Sending a HTTP POST request with JSON-encoded login parameters and receiving and decoding JSON response into a LoginResponse
///
/// It handles errors as bad URL construction, failed request body encoding, and response decoding. The use of asynchronous functions ensures non-blocking network operations, which is essential for responsive applications.
///
/// - Parameters:
///   - parameters: It's a LoginRequest type, which holds the necessary login request data.
///   - appEnvironment: It's a Singleton to share an access to AppEnvironment. AppEnvironment contains configuration settings like URLs for diferentr environments (testing, prod)

import Foundation

struct LoginAction {
    
   
    
    let scheme = AppEnvironment.shared.getScheme(scheme: .https)
    let host = AppEnvironment.shared.getURL(api: .test)
    let path = "/patients/user"
    let method : HTTPMethod = .POST
    var parameters: LoginRequest
    
    
    
    
    
    /// Builds a URL by combining the schem, host, and path parameters. It uses the URLComponents class to construct the URL
    /// - parameters:
    ///     - scheme: The protocol (http or http)
    ///     - host: The server domain
    ///     - path: The endpoint path
    ///- returns: If the URL can't be created, the function throws an URLError with .badURL code.
//    func setupURL(scheme: String, host: String, path: String ) throws -> URL? {
//        var components = URLComponents()
//        components.scheme = scheme
//        components.host =  host
//        components.path = path.hasPrefix("/") ? path : "/" + path
//
//        guard let url = components.url else { throw URLError(.badURL) }
//
//        return url
//    }
    
    
    /// Sends a login request to a server. It's marked as async, meaning it runs asynchronously and can be awaited.
    /// - Firstly, it creates a URL by calling setURL function. The URL is built using
    ///     - https as the scheme.
    ///     - A host obtained from the appEnvironment object.
    ///     - A path /patients/user
    ///  If the URL setup fails, it throws a URLError
    ///
    ///     -
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

//        guard let url = try setupURL(scheme: "https", host: appEnvironment.getURL(api: .test), path: "patients/user") else { throw URLError(.badURL)}
//        
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = HTTPMethod.POST.rawValue
//        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
//        
//        do {
//            let jsonEncoder = JSONEncoder()
//            request.httpBody = try jsonEncoder.encode(parameters)
//        } catch {
//            throw URLError(.cannotParseResponse)
//        }
//        
//        let (data, _) = try await URLSession.shared.data(for: request)
//        do {
//            
//            let jsonDecoder = JSONDecoder()
//            let response = try jsonDecoder.decode(LoginResponse.self, from: data)
//            return response
//        } catch {
//            throw URLError(.cannotDecodeContentData)
//        }
        
        
    }
}
