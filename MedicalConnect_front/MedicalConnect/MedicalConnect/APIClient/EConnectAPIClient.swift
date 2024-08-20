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
    
    func sendData<T:Encodable>(endpoint: Endpoint, object: T ) async throws{
       
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
            let dataAndRequest = try  await request.get(request: urlRequest)
        } catch let error as NetworkError  {
            print("Network error: \(error)")
        } catch {
            print(error.localizedDescription)
        }

    }
}
