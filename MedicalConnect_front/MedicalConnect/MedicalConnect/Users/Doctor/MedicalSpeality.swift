/// `MedicalSpeality` is an enum represents a collection of medical specialties in a healthcare application. It conforms to the String, CaseIterable, and Codable protocols, allowing it to be used in various contexts, such as displaying a list of specialties and serializing/deserializing data for storage or network communication.

import Foundation

enum MedicalSpeality: String, CaseIterable, Codable {
    case cardiology = "Cardiología"
     case dermatology = "Dermatología"
     case endocrinology = "Endocrinología"
     case gastroenterology = "Gastroenterología"
     case geriatrics = "Geriatría"
     case gynecology = "Ginecología"
     case hematology = "Hematología"
     case immunology = "Inmunología"
     case nephrology = "Nefrología"
     case neurology = "Neurología"
     case oncology = "Oncología"
     case orthopedics = "Ortopedia"
     case pediatrics = "Pediatría"
     case psychiatry = "Psiquiatría"
     case pulmonology = "Neumología"
     case radiology = "Radiología"
     case rheumatology = "Reumatología"
     case urology = "Urología"
}
