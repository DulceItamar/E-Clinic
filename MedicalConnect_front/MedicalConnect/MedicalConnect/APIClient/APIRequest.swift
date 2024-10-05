///`APIRequest` is a generic class that handles making HTTP requests ande decoding the response.
/// The class supports asynchronous API calls with the ability to send parameters and decode the response
/// into a specific model type.
///
/// - Parameters:
///   - Parameters: Encodable type representing the data to be sent with the request (e.g., request body).
///   - Model: Decodable type representing the expected response model (e.g., a login response).
///
import Foundation


class APIRequest<Parameters: Encodable, Model: Decodable> {
    
    
    ///`call` makes an asynchronous HTTP request to the given API endpoint and decodes the response into a `LoginResponse` model.
    /// - Parameters:
    ///   - scheme: The URL scheme (either "http" or "https").
    ///   - host: The server's host (domain) where the request is sent.
    ///   - path: The endpoint path of the API.
    ///   - method: The HTTP method used in the request (e.g., GET, POST).
    ///   - parameters: The parameters (optional) to be sent in the request body, must conform to `Encodable`.
    /// - Returns: A `LoginResponse` object that represents the decoded data from the API response.
    /// - Throws: An `URLError` if there are issues with URL formation, request creation, or response decoding.
    static func call (
        scheme: String,
        host: String,
        path: String,
        method: HTTPMethod,
        parameters: Parameters? = nil
    ) async throws -> LoginResponse {
       
        
        // Construct the URL from the provided scheme, host, and path using the `setupURL` method.
        guard let url = try setupURL(scheme: scheme, host: host, path: path) else { throw URLError(.badURL)}
        
        
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = method.rawValue
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //TEST - For a mock server in Postman
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
        
        do {
            
            
            guard let parameters = parameters else { throw URLError(.fileDoesNotExist) }
            
                let jsonEncoder = JSONEncoder()
                request.httpBody = try jsonEncoder.encode(parameters)
            
        } catch {
            throw URLError(.cannotParseResponse)
        }
        
      
        do {
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let jsonDecoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let response = try jsonDecoder.decode(LoginResponse.self, from: data)
           
            return response
            
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
    
    
    
        /// `setupURL` constructs a URL by combining the provided scheme, host, and path using `URLComponents`.
        /// - Parameters:
        ///   - scheme: The URL scheme, such as "http" or "https".
        ///   - host: The host name of the server (e.g., "api.example.com").
        ///   - path: The API path or endpoint (e.g., "/login").
        /// - Returns: A `URL` object if the combination of scheme, host, and path is valid, otherwise `nil`.
        /// - Throws: An `URLError` with a `.badURL` code if the URL can't be constructed.
    static func setupURL(scheme: String, host: String, path: String ) throws -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host =  host
        components.path = path.hasPrefix("/") ? path : "/" + path // Ensure the path starts with '/'.
        
        
        guard let url = components.url else { throw URLError(.badURL) }
        
        return url
    }
}
