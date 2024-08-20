//
//  GetPatientDataEndpoint.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import Foundation
struct GetAllActivePatientsEndpoint: Endpoint {

    


    var path: String = "/patients"
    var method: HTTPMethod = .GET
    var query: [URLQueryItem] = [URLQueryItem(name: "", value: "")]
    
}


struct GetPatientByIdEndpoint: Endpoint {

    var path: String = "/patients/by-id"
    var method: HTTPMethod = .GET
    var query: [URLQueryItem] 
    
    init(id: String){
        self.query = [URLQueryItem(name: "id", value: id)]
    }
 

}


struct GePatientByPhone: Endpoint {

    var path: String = "/patients/by-phone"
    var method: HTTPMethod = .GET
    var query: [URLQueryItem]
    
    init(phoneNumber: String ) {
        self.query = [URLQueryItem(name: "phone-number", value: phoneNumber)]
    }
   
}

struct GetAllPatientsByGenderEndpoint: Endpoint {
    var path: String = "/patients/by-gender"
    var method: HTTPMethod = .GET
    var query: [URLQueryItem]
    
    init(gender: Gender ) {
        self.query = [URLQueryItem(name: "gender", value: gender.rawValue)]
    }
}


struct PostSignUpNewPatient: Endpoint {
    var path: String = "/users/patients"
    var method: HTTPMethod = .POST
    var query: [URLQueryItem] = [URLQueryItem(name: "", value: "")]
    
}


struct UpdatePatientById: Endpoint {
    var path: String = "/patients"
    
    var method: HTTPMethod = .UPDATE
    
    var query: [URLQueryItem] = [URLQueryItem(name: "", value: "")]
    
    
}


struct DeleteDisablePatientAccountById: Endpoint {
    var path: String = "/patients/"
    
    var method: HTTPMethod = .DELETE
    var query: [URLQueryItem]
    
    init(id: String){
        self.query = [URLQueryItem(name: "id", value: id)]
    }
    
    
}

enum PatientEndpoints {
    case GetAllPatient
    case GetPatientById
    case GetPatientByphone
    case GetAllPatientsByGender
    case SignUpPatient
    case UpdatePatientById
    case DisablePatientAccount
}


