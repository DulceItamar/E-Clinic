///`workDays` is an enum defines the days of the week as they relate to a doctor's scheduling availability for medical appointments. Each case in the enum corresponds to a specific day, represented by a short string in Spanish

import Foundation

enum WorkDays: String, CaseIterable, Codable {
    case  monday = "Lun"
    case tuesday = "Ma"
    case wednesday = "Mie"
    case thursday = "Jue"
    case friday = "Vi"
    case saturday = "Sa"
    case sunday = "Do"
}
