/// `DoctorEvaluationData` is designed to hold evaluation-related information for a doctor. This includes the average rating from evaluations, the total number of consultations, and an optional list of reviews. This struct conforms to the Hashable, Identifiable, and Codable protocols, making it easy to use in collections and facilitating encoding/decoding to and from formats like JSON.
/// - Parameters:
///    - id: A unique identifier for each DoctorEvaluationData instance. Automatically generated upon initialization, ensuring each evaluation data entry is uniquely identifiable.
///    - averageOfEvaluations: Represents the average score of evaluations given to the doctor. It can be nil if no evaluations are available.
///    - numberOfConsults: The total number of consultations that the doctor has conducted. This can also be nil if no data is available.
///    - reviews: An optional array of Review instances associated with the doctor. This property can be nil if no reviews are provided.

import Foundation

struct DoctorEvaluationData: Hashable, Identifiable, Codable {
    var id: UUID = UUID()
    var averageOfEvaluations: Float?
    var numberOfConsults: Int?
    var reviews: [Review]?
}






