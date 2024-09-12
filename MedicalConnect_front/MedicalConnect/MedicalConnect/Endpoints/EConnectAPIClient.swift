//
//  EConnectAPIClient.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/08/24.
//

import Foundation
public struct EConnectAPIClient {
    let request: Request
    let router: Router
    let parser: Parser
    
    init(request: Request = Request(), router: Router = Router(), parser: Parser = Parser()) {
        self.request = request
        self.router = router
        self.parser = parser
    }
    
    func sendData<T:Encodable>(endpoint: Endpoint, object: T ) async throws -> Data? {
       
        //Endpoint URL
        
        guard let uri = router.routedEndpoint(endpoint, url: .local) else {
            //throw URLError(.badURL)
            throw NetworkError.badURL("Failed to route endppoint \(endpoint)")
        }
        
       
        //Swift Object to JSON
        let jsonEncoder = JSONEncoder()
        guard let jsonData =  parser.parseSendData(object, encoder: jsonEncoder) else {
            throw NetworkError.encodingError("Failed to encode object")
        }
            
        //Build Request
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = jsonData
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Send Request and handle request
        do {
            return try await request.get(request: urlRequest)
        } catch let error as NetworkError  {
            print("Network error: \(error)")
            throw error
           
        } catch {
            print("Unexpected error: \(error.localizedDescription) ")
            throw error
        }
    }
    
    
    
    func loginData(endpoint: Endpoint) async throws -> Data? {
        guard let result = try await fetchData(endpoint: endpoint) else {
            throw NetworkError.unprocessableEntity
        }
        
        return result

    }
    
   private func fetchData(endpoint: Endpoint) async throws -> Data? {
        
        // Endpoint
       guard let uri = router.routedEndpoint(endpoint, url: .test) else {
            throw URLError(.badURL)
        }
        
        //Build request
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        //Sending a Request and handling the Response
        do {
            return try await request.get(request: urlRequest)
        } catch let error as NetworkError {
            print("Network error: \(error.localizedDescription)")
          
            
        } catch {
            print(error.localizedDescription)
        }
       
        return nil
    }
}



