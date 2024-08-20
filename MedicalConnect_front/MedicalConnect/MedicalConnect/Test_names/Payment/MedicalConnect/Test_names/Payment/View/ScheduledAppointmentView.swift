//
//  ScheduledAppointmentView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 29/07/24.
//

import SwiftUI

struct ScheduledAppointmentView: View {
    var body: some View {
        VStack{
            UpperFrame(label: "")
            NavigationStack {
                
                VStack{
                    
                    
                    
                
                    BacgroundMessageView()
                    
                    Button(action: {
                        print("Volver a Home")
                    }, label: {
                        Text("Volver a Home")
                            .padding(.horizontal, 24)
                            .font(Font.custom("Montserrat-SemiBold", size: 16))
                            .kerning(1.2)
                    })
                    .buttonStyle(MainButtonStyle(isEnabled: true))
                    .padding(.vertical, 32)
                    
                    Text("Recibirás tu factura por mail, ante cualquier duda, puedes contactarnos ingresando a Configuración.")
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
             
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)


            }
        }
    }
}

#Preview {
    ScheduledAppointmentView()
}
