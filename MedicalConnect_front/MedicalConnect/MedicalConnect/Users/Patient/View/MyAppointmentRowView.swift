//
//  MyAppointmentRowView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

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
