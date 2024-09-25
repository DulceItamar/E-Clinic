//
//  AppEnvironment.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import Foundation

class AppEnvironment {
    static let shared: AppEnvironment = AppEnvironment()
    
    private init(){}
    
    enum Scheme {
        case https
        case http
    }
    
    func getScheme(scheme: Scheme) -> String {
        switch scheme {
            case .https:
                return "https"
            case .http:
                return "http"
        }
    }
    
    enum Base {
        case local
        case test
    }
    
    func getURL(api: Base) -> String  {
        switch api {
            case .local:
                return "localhost:8080"
            case .test:
                return "f91bcd24-26d5-4794-b928-69b896db429a.mock.pstmn.io"
                 
        }
    }
}
