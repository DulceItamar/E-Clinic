//
//  BacgroundMessageView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 29/07/24.
//

import SwiftUI

struct BacgroundMessageView: View {
    @EnvironmentObject private var routeManager : TabRouter
    private let message: String = "Podrás ver los detalles en el menú MIS CITAS, ingresando a tu perfil."
    private let submessage: String = "Allí podrás crear un recordatorio si lo deseas y te enviaremos una notificación el día anterior a la consulta."
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.mint)
                .opacity(0.3)
                .shadow(color: .black, radius: 5, x: 2, y: 10)
                .overlay(alignment: .center) {
                    
                    VStack(alignment: .center){
                        Text("¡TU CITA FUE PROGRAMADA!")
                            .font(Font.custom("Montserrat-Bold", size: 18))
                            .padding(.bottom,10)
                        
                        Text(message)
                            .font(Font.custom("Montserrat-semiBold", size: 16))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                            .padding(.bottom,10)
                        
                        Text(submessage)
                            .font(Font.custom("Montserrat-Regular", size: 16))
                            .padding(.bottom,10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    }
                    .padding(.horizontal,12)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                }
                .frame(height: 260)
            
            Button(action: {
                
                routeManager.popToRootHomeRoute()
//                routeManager.popToRoot()
                
                
                print("Realizar pago")
            }, label: {
                Text("Volver a Home")
                    .padding(.horizontal, 24)
                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                    .kerning(1.2)
            })
            .buttonStyle(MainButtonStyle(isEnabled: true))
            .padding(.vertical, 12)
        }
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Cita confirmada")
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 16)
        .environmentObject(routeManager)
    }
}

#Preview {
    BacgroundMessageView()
        .environmentObject(TabRouter())
}
