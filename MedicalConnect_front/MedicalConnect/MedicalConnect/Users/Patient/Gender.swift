/// `Gender` is an enum that represents a person's gender, providing three possible values: Female, Male, and Other.

import Foundation
enum Gender: String, CaseIterable, Codable {
    case FEMALE = "Femenino"
    case MALE = "Masculino"
    case OTHER = "Otro"
}
