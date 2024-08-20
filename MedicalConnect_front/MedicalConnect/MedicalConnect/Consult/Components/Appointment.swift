//
//  Appointment.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import Foundation


struct Appointment: Hashable, Identifiable {
    var id = UUID()
    let doctor: Doctor
    let patient: Patient
    let date: Date
    let symptoms: String
    let diagnosis: String
    let servicePrice: Float
    let totalPrice: Float
}
