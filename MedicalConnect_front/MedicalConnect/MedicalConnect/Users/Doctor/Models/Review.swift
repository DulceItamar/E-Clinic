//
//  Reviews.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/07/24.
//

import Foundation

struct Review: Hashable, Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var evaluation: Float
    var reviewDescription: String?
}
