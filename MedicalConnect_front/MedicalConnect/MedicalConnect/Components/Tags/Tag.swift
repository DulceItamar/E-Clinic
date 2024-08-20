//
//  Tag.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/08/24.
//

import Foundation
import SwiftUI

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
}


