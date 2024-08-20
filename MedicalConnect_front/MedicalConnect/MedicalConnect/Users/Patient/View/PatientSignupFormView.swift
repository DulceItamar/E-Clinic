//
//  PatientSignupFormView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct PatientSignupFormView: View {
   //@StateObject var userM = UserManager()
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
                        
                        Button(action: {
                            patientManager.saveUserDataInPatient(userData: user)
                            print(patientManager.patient.user.name)
                            
                            Task {
                                await patientManager.sendPatientInfo()
                            }
                            
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
