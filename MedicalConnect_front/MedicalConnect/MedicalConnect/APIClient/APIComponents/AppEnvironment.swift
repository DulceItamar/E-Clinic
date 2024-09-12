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
        case test
    }
    
    func getURL(api: Base) -> String  {
        switch api {
            case .local:
                return "http://localhost:8080/"
            case .test:
                return "f91bcd24-26d5-4794-b928-69b896db429a.mock.pstmn.io"
                 
        }
    }
}
