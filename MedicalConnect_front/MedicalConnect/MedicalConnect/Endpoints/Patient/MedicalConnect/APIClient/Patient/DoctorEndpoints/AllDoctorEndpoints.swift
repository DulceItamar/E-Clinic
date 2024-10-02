//
//  AllDoctorEndpoints.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import Foundation
struct GetAllActiveDoctorsEndpoint: Endpoint {

    var path: String = "/doctors"
    var method: HTTPMethod = .GET
    var query: [URLQueryItem] = [URLQueryItem(name: "", value: "")]
    
}
