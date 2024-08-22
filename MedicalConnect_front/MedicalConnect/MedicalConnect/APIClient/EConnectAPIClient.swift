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
    
    func sendData<T:Encodable>(endpoint: Endpoint, object: T ) async throws -> Result<Data, Error> {
       
        //Endpoint URL
        
        guard let uri = router.routedEndpoint(endpoint, url: .local) else {
            throw URLError(.badURL)
        }
        
       
        //Swift Object to JSON
        let jsonData = parser.parseSendData(object, encoder: JSONEncoder())
            
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
            return .failure(error)
        } catch {
            print(error.localizedDescription)
            return .failure(error)
        }

    }
    
    
    
    func loginData(endpoint: Endpoint) async throws -> LoginUser {
        let result = try await fetchData(endpoint: endpoint)
        
        switch result {
            case .success(let data):
                guard let decodeData = parser.parseReceiveData(data, type: LoginUser.self, decoder: JSONDecoder()) else { throw URLError(.badURL)  }
                
                print(decodeData as Any)
                return decodeData
                
            case .failure(let error):
                parser.printDecodable(error: error)
                throw error
        }

    }
    
   private func fetchData(endpoint: Endpoint) async throws -> Result<Data, Error>  {
        
        // Endpoint
        guard let uri = router.routedEndpoint(endpoint, url: .local) else {
            throw URLError(.badURL)
        }
        
        //Build request
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        //Sending a Request and handling the Response
        do {
            return try await request.get(request: urlRequest)
        } catch let error as NetworkError {
            print("Network error: \(error)")
            return .failure(error)
            
        } catch {
            print(error.localizedDescription)
            return .failure(error)
        }
        
    }
}



