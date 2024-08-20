//
//  ShowData.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/07/24.
//

import Foundation


class DoctorDataValidations {
    
    
    func getAverageOfEvaluations(doctor: Doctor) -> Float {
        
        
        guard let average = doctor.evaluationData.averageOfEvaluations else { return 0.00 }
        
        return average
    }
    
    
    func getNumberOfConsults(doctor: Doctor) -> Int {
        guard let consults = doctor.evaluationData.numberOfConsults else { return 0 }
        
        return consults
    }
    
    
    func getReviews(doctor: Doctor) -> [Review] {
        let review = Review(
            name: "",
            evaluation: 0.00,
            reviewDescription: "Todavía no tiene reviews"
        )
        
        guard let reviews = doctor.evaluationData.reviews else { return [review] }
        return reviews
        
        
     
    }
    
    func getReviewDescription(review description: String?) -> String {
        guard let reviewDescription = description else { return " Excelente servicio"}
        return reviewDescription
    }
    
    func getWorksDays(days: [WorkDays]) -> [String]{
        var daysStringFormat : [String] = []
    
        for day in days {
            daysStringFormat.append(day.rawValue)
        }
        return daysStringFormat
    }
    
    
}
