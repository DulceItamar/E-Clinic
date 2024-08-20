//
//  DoctorEvaluationData.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/07/24.
//

import Foundation

struct DoctorEvaluationData: Hashable, Identifiable {
    let id: UUID = UUID()
    var averageOfEvaluations: Float?
    var numberOfConsults: Int?
    var reviews: [Review]?
}






