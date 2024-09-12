//
//  APIService.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/08/24.
//

import Foundation



protocol APIRequestProtocol {
    func get(request: URLRequest) async throws -> Data
}

final class Request: APIRequestProtocol {
  
    

    
    func get(request: URLRequest) async throws -> Data {
       
        let (data, response) = try await URLSession.shared.data(for: request)
        
        
        return try verifyResponse(data: data, response: response)
        
    }
    
    
    private func verifyResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.badServerResponse
        }
        
        
        switch  httpResponse.statusCode {
            case 200...299:
                return data
            case 400:
                throw NetworkError.badRequest
            case 401:
                throw NetworkError.unauthorized
            case 402:
                throw NetworkError.paymentRequiered
            case 403:
                throw NetworkError.forbidden
            case 404:
                throw NetworkError.notFound
            case 413:
                throw NetworkError.requestEntityTooLarge
            case 422:
                throw NetworkError.unprocessableEntity
            case 500...599:
                throw NetworkError.badServerResponse
            default:
                throw NetworkError.http(httpeResponse: httpResponse, data: data)
        }
    }
    
    
    
    
//    private func verifyResponse(data: Data, response: URLResponse) -> Result<Data, Error> {
//        
//        guard let httpResponse = response as? HTTPURLResponse else {
//            return .failure(NetworkError.unknown)
//        }
//        
//        
//        print("Estatus code: \(httpResponse.statusCode)")
//        switch httpResponse.statusCode {
//            case 200...299:
//                return .success(data)
//            case 400...499:
//          
//                return .failure(NetworkError.badRequest)
//            case 500...599:
//                return .failure(NetworkError.ServerError)
//            default:
//                return .failure(NetworkError.unknown)
//        }
//    }
//    

}


