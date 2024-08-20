//
//  DoctorSignupFormView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct DoctorSignupFormView: View {
    let user: User
    @ObservedObject var doctorManager = DoctorManager()
   
    @State var addingLabels: String = ""
    @State var tags: [String] = []
    @State var continueAccess: Bool = false
    
    @State private var totalHeight = CGFloat.zero
    var body: some View {

        
            UpperFrame(label: "Te pediremos algunos datos importantes")
            
        
        GeometryReader { geometry in
            ScrollView {
                
                
                VStack(alignment: .leading, content: {
                    Text("¿Cuál es tu especialidad médica?")
                        .font(Font.custom("Montserrat-SemiBold", size: 14))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            
                            .stroke(Color("babyBlue-300"), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        
                        Picker("Select your speciality", selection: $doctorManager.doctor.medicalSpeciality) {
                            ForEach(MedicalSpeality.allCases, id: \.self) { option in
                                Text(option.rawValue)
                                    
                                    
                            }
                        }
                        .padding(.vertical,5)
                        .pickerStyle(.menu)
                        .tint(.black)
                    }
                })
                .padding(EdgeInsets(top: geometry.size.height * 0.05, leading: 20, bottom: geometry.size.height * 0.05, trailing: 20))
                
                
                TextFieldDataView(label: "Cédula Profesional", prompt: "Ingrese su cédula", keyboard: .asciiCapable, data: $doctorManager.doctor.professionalLicense)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: geometry.size.height * 0.05, trailing: 16))
                
                
                BigFrameTextFieldView(label: "Escribe sobre tu experiencia", prompt: "Ginecóloga y obstetra como más de 5 años de experiencia, egresada de la Universidad de ...", keyboard: .asciiCapable, data: doctorManager.doctor.jobDescription)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: geometry.size.height * 0.05, trailing: 0))
                
                
                
                    TagView(services: $doctorManager.doctor.services, tagText: $doctorManager.addingServiceLabels)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: geometry.size.height * 0.05, trailing: 0))
                
                
                
                Button(action: {
                    doctorManager.saveUserDataInDoctor(userData: user)
                    print(doctorManager.doctor.user.name)
                    print("Saving patient data...")
                }, label: {
                    Text("Registrar")
                        .padding(.horizontal, 24)
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                        .kerning(1.2)
                })
                .buttonStyle(MainButtonStyle(isEnabled: doctorManager.continueAccess))
                .padding(.vertical, 12)
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
           
    }
}

#Preview {
    let test = TestData()
    return DoctorSignupFormView(user: test.doctor1.user)
}
