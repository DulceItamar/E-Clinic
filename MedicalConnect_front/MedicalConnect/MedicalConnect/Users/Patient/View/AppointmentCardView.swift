///`AppointmentCardView` is a custom SwiftUI view that represents a card for a medical appointment. The card includes details such as the doctor's name, medical specialty, appointment date, and actions for the user to enter a consultation or cancel the appointment.
/// - Parameters:
///    - doctorName: The name of the doctor associated with the appointment.
///    - medicalSpeciality: The medical specialty of the doctor. MedicalSpeality is assumed to be an enum that provides a rawValue string, representing the specialty of the doctor
///    - appointmentDate: The date and time of the appointment, which will be formatted as a readable date and time in the view.
///    - isEnableMedicalConsult: A state variable to determine whether the "Ingresar consulta" button (Enter Consultation) is enabled. The default value is false.
///
///
import SwiftUI

struct AppointmentCardView: View {
    let doctorName: String
    let medicalSpeciality: MedicalSpeality
    let appointmentDate: Date
    @State var isEnableMedicalConsult: Bool = false
    
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.backgroundCard100)
                .shadow(color: .main, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center) {
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        
                        Text(doctorName)
                            .padding(.vertical,8)
                            .font(Font.custom("Montserrat-Bold", size: 16))
                        
                        Group {
                            Text(medicalSpeciality.rawValue)
                                .padding(.bottom,8)
                            
                            Text("\(appointmentDate, format: .dateTime)")
                                .padding(.bottom,16)
                            
                        }
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        
                        Divider()
                        
                        
                        HStack {
                            
                            
                            
                            
                            Button(action: {
                                print("Ingresar consulta")
                            }, label: {
                                Text("Ingresar consulta")
                                
                                    .font(Font.custom("Montserrat-SemiBold", size: 12))
                                    .kerning(1.2)
                            })
                            .buttonStyle(MainButtonStyle(isEnabled: isEnableMedicalConsult))
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Button("Cancelar cita") {
                                print("Cancelar Consulta")
                            }
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }.frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                .frame(height: 200)
        }
    }
}

#Preview {
    AppointmentCardView(
        doctorName: "Dr Federico Torres",
        medicalSpeciality: MedicalSpeality.cardiology,
        appointmentDate: .now
    )
}
