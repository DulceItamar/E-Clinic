///`TypeOfUsers` is an enum that represents the types of user is signup. This enum conforms to `String`, `CaseIterable`, and `Codable`, making it ideal for displaying in user interfaces (like pickers) and easily encoding/decoding for data storage or network communication.
import Foundation
enum TypeOfUsers: String, CaseIterable, Codable {
    case patient = "Paciente"
    case doctor = "Doctor"
}
