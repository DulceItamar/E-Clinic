/// `MenuProfile` is an enum representing different sections or menu items in a user profile, such as personal data, appointments, studies, and treatments. Each case is a string corresponding to a user-facing label in Spanish.

import Foundation

enum MenuProfile: String, CaseIterable {
    case myData = "Mis datos"
    case myAppointments = "Mis citas"
    case myStudies = "Mis Estudios"
    case treatments = "Recetas"
}
