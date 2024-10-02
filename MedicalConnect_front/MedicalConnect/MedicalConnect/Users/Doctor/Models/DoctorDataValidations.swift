/// `DoctorDataValidations` is a class responsible for fetching and validating doctor-related data.
/// This class provides methods to retrieve key details about a doctor's evaluations, consults, reviews, and workdays, while ensuring that optional values are handled safely and appropriate default values are returned when needed.

import Foundation


final class DoctorDataValidations {
    
    ///`getAverageOfEvaluations`:  It returns the average of evaluations for a given doctor.
    /// This method checks if the average of evaluations is available. If not, it returns a default value of `0.00`.
    /// - Parameter doctor: The `Doctor` object from which the average evaluation is retrieved.
    /// - Returns: The average evaluation as a `Float`. Returns `0.00` if the value is unavailable.
    func getAverageOfEvaluations(doctor: Doctor) -> Float {
        guard let average = doctor.evaluationData.averageOfEvaluations else { return 0.00 }
        return average
    }
    
    
    ///`getNumberOfConsults`: It returns the number of consults for a given doctor.
    /// This method checks if the number of consults is available. If not, it returns a default value of `0`.
    /// - Parameter doctor: The `Doctor` object from which the number of consults is retrieved.
    /// - Returns: The number of consults as an `Int`. Returns `0` if the value is unavailable.
    func getNumberOfConsults(doctor: Doctor) -> Int {
        guard let consults = doctor.evaluationData.numberOfConsults else { return 0 }
        return consults
    }
    
    
    ///`getReviews`: It returns the list of reviews for a given doctor.
    /// This method checks if reviews are available. If not, it returns a default review indicating that no reviews are present.
    /// - Parameter doctor: The `Doctor` object from which reviews are retrieved.
    /// - Returns: An array of `Review` objects. Returns a default review if no reviews are available.
    func getReviews(doctor: Doctor) -> [Review] {
        let review = Review(
            name: "",
            evaluation: 0.00,
            reviewDescription: "Todavía no tiene reviews"
        )
        
        guard let reviews = doctor.evaluationData.reviews else { return [review] }
        return reviews
        
    }
    
    
    ///`getReviewDescription`: It returns a formatted description for a review.
    /// This method checks if a review description is available. If not, it returns a default message `"Excelente servicio"`.
    /// - Parameter description: The review description as an optional `String`.
    /// - Returns: A `String` representing the review description. Returns `"Excelente servicio"` if the description is nil.
    func getReviewDescription(review description: String?) -> String {
        guard let reviewDescription = description else { return " Excelente servicio"}
        return reviewDescription
    }
    
    
    ///`getWorksDays`: It returns the working days of a doctor in string format.
    /// This method converts an array of `WorkDays` enum values to their corresponding `String` raw values for display purposes.
    /// - Parameter days: An array of `WorkDays` enum values representing the days a doctor works.
    /// - Returns: An array of `String` values representing the working days in human-readable format.
    func getWorksDays(days: [WorkDays]) -> [String]{
        var daysStringFormat : [String] = []
    
        for day in days {
            daysStringFormat.append(day.rawValue)
        }
        return daysStringFormat
    }
    
}
