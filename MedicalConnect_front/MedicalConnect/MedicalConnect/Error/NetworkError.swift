//
//  Requester.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/08/24.
//

import Foundation




enum NetworkError: Error, LocalizedError {
    
    case missingRequieredFields(String)
    case invalidParameters(operation: String, parameters: [Any])
    case badRequest
    case unauthorized
    case paymentRequiered
    case forbidden
    case notFound
    case requestEntityTooLarge
    case unprocessableEntity
    case http(httpeResponse: HTTPURLResponse, data: Data)
    case invalidResponse(Data)
    case deleteOperationFailed(String)
    case network(URLError)
    case unknown(Error?)
    case badURL(String)
    case encodingError(String)
    case decodingError(String)
    case badServerResponse

  
}


