//
//  Router.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import Foundation

class Router {
    
    private let environment: AppEnvironment
    
    init(environment: AppEnvironment = AppEnvironment()){
        self.environment = environment
    }
    
    
    func routedEndpoint(_ endpoint: Endpoint, url : AppEnvironment.Base) -> URL? {
       
        let baseURL = environment.getURL(api: url)
        
        var components = URLComponents(string: baseURL)
        
        components?.path = endpoint.path
        components?.queryItems = endpoint.query
        

        return components?.url
    }
    
}


//

