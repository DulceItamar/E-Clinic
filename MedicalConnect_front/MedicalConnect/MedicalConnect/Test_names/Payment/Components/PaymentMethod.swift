//
//  PaymentMethod.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import Foundation

struct PaymentMethod: Hashable, Identifiable, Encodable {
    var id = UUID()
    let name: String
    let cardNumber: String
    let expiredDate: String
    var cvv: String?
    
    
}
