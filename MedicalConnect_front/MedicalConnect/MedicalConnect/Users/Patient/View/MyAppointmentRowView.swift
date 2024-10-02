/// `MyAppointmentRowView` is a custom SwiftUI view that displays details about a medical appointment, including the doctor's name, medical specialty, and appointment date. The view is styled with a rounded rectangle and includes text with custom fonts.
/// - Parameters:
///    - doctorName: The name of the doctor associated with the appointment.
///    - medicalSpeciality: The medical specialty of the doctor. MedicalSpeality is assumed to be an enum that provides a rawValue string, representing the specialty of the doctor
///    - dateAppointment: The date and time of the appointment, which will be formatted as a readable date and time in the view.
///

import SwiftUI

struct MyAppointmentRowView: View {
    let doctorName: String
    let medicalSpeciality: MedicalSpeality
    let dateAppointment: Date
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.backgroundRows200)
                .shadow(color: .main, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center) {
                    
                  
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(doctorName)
                                .font(Font.custom("Montserrat-semiBold", size: 16))
                            
                            
                            Text(medicalSpeciality.rawValue)
                                .font(Font.custom("Montserrat-Regular", size: 14))
                            
                            
                            Text("\(dateAppointment, format: .dateTime)")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                            
                            
                        }
                        .padding(16)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                .frame(height: 90)
        }
    }
}

#Preview {
    MyAppointmentRowView(
        doctorName: "Dr. Federico Torres",
        medicalSpeciality: MedicalSpeality.cardiology,
        dateAppointment: .now
    )
}
