//
//  User.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import Foundation

protocol UserProtocol: Hashable {
    var name: String { get }
    var email: String { get }
    var password: String { get }
    var phone: String { get }
    var typeOfUser: TypeOfUsers { get }
}

struct User: UserProtocol {
 
    var name: String
    var email: String
    var password: String
    var phone: String
    var typeOfUser: TypeOfUsers
    
    
}
