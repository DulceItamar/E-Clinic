//
//  AppEnvironment.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import Foundation

class AppEnvironment {
    enum Base {
        case local
    }
    
    func getURL(api: Base) -> String  {
        switch api {
            case .local:
                return "http://localhost:8080/"
                
                 
        }
    }
}
