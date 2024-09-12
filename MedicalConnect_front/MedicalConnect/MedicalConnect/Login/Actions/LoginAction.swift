//
//  LoginAction.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/09/24.
//

import Foundation

struct LoginAction {
    var parameters: LoginRequest
    private let appEnvironment =  AppEnvironment()
    
    
    
    func makeURL() throws -> URL? {
        let scheme: String = "https"
        let host: String = appEnvironment.getURL(api: .test)
        let path = "/patients/user"
        
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
      
        guard let url = components.url else { throw URLError(.badURL) }

        return url
    }
    
    func call() async throws -> LoginResponse {
//
        guard let url = try makeURL() else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
        
        do {
            let jsonEncoder = JSONEncoder()
            request.httpBody = try jsonEncoder.encode(parameters)
        } catch {
            throw URLError(.cannotParseResponse)
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(LoginResponse.self, from: data)
            return response
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
        
        
    }
}
