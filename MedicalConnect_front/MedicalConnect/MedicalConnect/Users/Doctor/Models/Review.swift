/// `Review` represents a user-generated evaluation of a doctor or service within the application. It captures the reviewer’s name, their evaluation score, and an optional description of their review. This struct conforms to the Hashable, Identifiable, and Codable protocols, making it suitable for use in collections and facilitating easy encoding/decoding to and from external data formats like JSON.
/// - Parameters:
///    - id: A unique identifier for each Review instance. This identifier is automatically generated upon initialization, ensuring each review is uniquely identifiable.
///    - name: The name of the individual who wrote the review. This property captures the identity of the reviewer, making it easier to understand who provided the feedback.
///    - evaluation: A numerical rating given by the reviewer, typically representing the quality of service received. This score can be used to calculate average ratings or overall satisfaction levels.
///    - reviewDescription: An optional text field that provides additional comments or details about the reviewer’s experience. This field can be nil if the reviewer chooses not to provide a description.

import Foundation

struct Review: Hashable, Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var evaluation: Float
    var reviewDescription: String?
}
