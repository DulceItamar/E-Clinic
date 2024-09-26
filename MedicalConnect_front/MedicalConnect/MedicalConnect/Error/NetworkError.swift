/// `NetworkError` is an enum that represents various errors that can occur during the http request process. Each case in the enum corresponds to a specific error scenario.

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


