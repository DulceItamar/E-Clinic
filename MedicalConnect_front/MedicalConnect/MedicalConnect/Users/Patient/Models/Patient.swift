///`Patient` is a struct representing a patient in a medical context. It conforms to Hashable, Identifiable, Decodable, and Encodable protocols, meaning that it can be used in collections requiring unique identification, serialized to/from JSON, and compared for equality.
///- Parameters:
/// - id: A unique identifier for each Patient instance, automatically generated using UUID(). This property is implicitly required by the Identifiable protocol.
/// - user: The User associated with this patient, containing basic user information such as name, email, password, and phone number.
/// - birthdate: The patient's date of birth.
/// - allergies: A description of any allergies the patient has.
/// - gender: The patient's gender.
/// - paymentMethods: An optional array of the patient's payment methods. Each payment method could be represented by a PaymentMethod type, which could include details like card number, card name, and expiration date.
import Foundation

struct Patient: Hashable, Identifiable, Encodable  {



    var id = UUID()
    var user : User
    var birthdate: Date
    var allergies: String
    var gender: Gender
    var paymentMethods: [PaymentMethod]?
    
}




