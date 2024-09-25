//
//  APIRequest.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/09/24.
//

import Foundation


class APIRequest<Parameters: Encodable, Model: Decodable> {
    
    static func call (
        scheme: String,
        host: String,
        path: String,
        method: HTTPMethod,
        parameters: Parameters? = nil
        
    ) async throws -> LoginResponse {
       
        guard let url = try setupURL(scheme: scheme, host: host, path: path) else { throw URLError(.badURL)}
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
        
        do {
            
            
            guard let parameters = parameters else { throw URLError(.fileDoesNotExist)}
         
                let jsonEncoder = JSONEncoder()
                request.httpBody = try jsonEncoder.encode(parameters)
            
            
        } catch {
            throw URLError(.cannotParseResponse)
        }
        
      
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(LoginResponse.self, from: data)
            return response
        } catch {
            throw URLError(.cannotDecodeContentData)
        }

    }
    
    /// Builds a URL by combining the schem, host, and path parameters. It uses the URLComponents class to construct the URL
    /// - parameters:
    ///     - scheme: The protocol (http or http)
    ///     - host: The server domain
    ///     - path: The endpoint path
    ///- returns: If the URL can't be created, the function throws an URLError with .badURL code.
    static func setupURL(scheme: String, host: String, path: String ) throws -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host =  host
        components.path = path.hasPrefix("/") ? path : "/" + path

        guard let url = components.url else { throw URLError(.badURL) }

        return url
    }
    
    
}
