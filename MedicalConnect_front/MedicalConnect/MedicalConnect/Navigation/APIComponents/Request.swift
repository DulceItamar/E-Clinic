//
//  APIService.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/08/24.
//

import Foundation



protocol APIRequestProtocol {
    func get(request: URLRequest) async throws -> Result<Data, Error>
}

final class Request: APIRequestProtocol {

    
    func get(request: URLRequest) async throws -> Result<Data, any Error> {
       
        let (data, response) = try await URLSession.shared.data(for: request)
        return verifyResponse(data: data, response: response)
        
    }
    
    
    private func verifyResponse(data: Data, response: URLResponse) -> Result<Data, Error> {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.unknown)
        }
        
        switch httpResponse.statusCode {
            case 200...299:
                return .success(data)
            case 400...499:
                return .failure(NetworkError.badRequest)
            case 500...599:
                return .failure(NetworkError.ServerError)
            default:
                return .failure(NetworkError.unknown)
        }
    }
}


