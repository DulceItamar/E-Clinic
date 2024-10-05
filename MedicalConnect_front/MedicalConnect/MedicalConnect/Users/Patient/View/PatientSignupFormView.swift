///`PatientSignupFormView`  is a SwiftUI view that represents a patient sign-up form. It collects key user information such as phone number, gender, birthdate, and allergies. The form interacts with a PatientManager (a view model) to manage the state of the patient's data and save it upon submission.
/// - Parameters:
///    - patientManager: A StateObject for managing the patient's data using PatientManager. This object keeps track of the form’s state and handles saving the patient’s information.
///    - user: The User instance provided to the view, representing the initial user information such as name, email, and phone. This is likely passed from a prior sign-up step.


import SwiftUI

struct PatientSignupFormView: View {

    @StateObject var patientManager = PatientManager()
   
    let user: User
    
   
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
               
                    UpperFrame(label: "Te pediremos algunos datos importantes")
                    
                    
                    ScrollView {
                        TextFieldDataView(label: "Número de teléfono móvil", prompt: "+549 111 111 111", keyboard: .phonePad, data: $patientManager.patient.user.phone)
                            .padding(EdgeInsets(top: geometry.size.height * 0.05, leading: 16, bottom: geometry.size.height * 0.04, trailing: 16))
                        
                        
                        
                        VStack(alignment: .leading, content: {
                            Text("Género")
                                .font(Font.custom("Montserrat-SemiBold", size: 14))
                            Picker("Select your gender", selection: $patientManager.patient.gender) {
                                ForEach(Gender.allCases, id: \.self) { option in
                                    Text(option.rawValue)
                                        
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        })
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: geometry.size.height * 0.04, trailing: 16))
                        
                        
                        
                        HStack {
                            
                            DatePicker("Fecha de Nacimiento", selection: $patientManager.patient.birthdate, displayedComponents: .date)
                                .font(Font.custom("Montserrat-SemiBold", size: 14))
                                .datePickerStyle(.compact)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: geometry.size.height * 0.04, trailing: 16))
                        
                        
                        
                        VStack(alignment: .leading, content: {
                            Text("¿Padeces alguna alergia?")
                                .font(Font.custom("Montserrat-SemiBold", size: 14))
                            Picker("Allergies", selection: $patientManager.existAllergies) {
                                ForEach(Allergies.allCases, id: \.self) { option in
                                    Text(option.rawValue)
                                        
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        })
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: geometry.size.height * 0.05, trailing: 16))
                        
                        
                        
                        if patientManager.existAllergies == .yes {
                
                            
                            BigFrameTextFieldView(label: "Escribe tus alergias en el siguiente recuadro", prompt: "Tengo alergia a...", keyboard: .asciiCapable, data:  patientManager.patient.allergies)
                        }
                        
                        
                        // A button labeled "Continuar" (Continue). When pressed, it triggers the saveUserDataInPatient(userData:) function from PatientManager, saving the patient's data. The button is styled using MainButtonStyle, and its enabled state is controlled by patientManager.continueAccess, which likely checks if all necessary fields are filled.
                        Button(action: {
                            patientManager.saveUserDataInPatient(userData: user)
                            print(patientManager.patient.user.name)
                            
                            
                            print("Saving patient data...")
                        }, label: {
                            Text("Continuar")
                                .padding(.horizontal, 24)
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .kerning(1.2)
                        })
                        .buttonStyle(MainButtonStyle(isEnabled: patientManager.continueAccess))
                        .padding(.vertical, 12)
                    }
                    Spacer()
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
    }
}

#Preview {
    let test = TestData()
    return PatientSignupFormView(user: test.patient1.user)
}
