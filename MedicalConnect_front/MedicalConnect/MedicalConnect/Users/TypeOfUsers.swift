//
//  TypeOfUsers.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import Foundation
enum TypeOfUsers: String, CaseIterable, Codable {
    case patient = "Paciente"
    case doctor = "Doctor"
}
