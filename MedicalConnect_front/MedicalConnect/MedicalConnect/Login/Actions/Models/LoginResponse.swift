//
//  LoginResponse.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/09/24.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}


struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
