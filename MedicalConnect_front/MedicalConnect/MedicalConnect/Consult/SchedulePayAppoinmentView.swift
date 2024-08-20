//
//  ScheduleAppointmentView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI

struct SchedulePayAppoinmentView: View {
    
    let doctor: Doctor
    let consultPrice: Float = 15
    let servicePrice: Float = 2
    let finalPrice: Float = 17
    let test = TestData()
    
    @State var selectedPaymentMethod: PaymentMethod?
    @State var isPaymentMethodCheck : Bool = false 
    @State var selectedAppointmenDate: Date = Date()
    @State var confirmAppointment: Bool = false
    @EnvironmentObject private var route : TabRouter

    var body: some View {
        
        
        VStack {
            UpperFrame(label: "Programa tu cita")
            ScrollView {
            
            
                VStack{
                    DatePicker("Fecha y hora de tu cita", selection: $selectedAppointmenDate, in: Date()..., displayedComponents: [.date, .hourAndMinute] )
                        .font(Font.custom("Montserrat-semiBold", size: 14))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top: 25, leading: 16, bottom: 25, trailing: 16))
            
            
            
                VStack(alignment: .leading){
                    
                    Text("Medios de pago")
                        .font(Font.custom("Montserrat-semiBold", size: 20))
                        .padding(.bottom, 16)
                    
                    
                    
                    if test.patient1.paymentMethods != nil{
                        ForEach(test.patient1.paymentMethods!, id: \.self){ method in
                            PaymentMethodCardView(paymentName: method.name, checked: selectingPaymentMethod(method: method))
                        }
                    } else {
                        Text("Todavía no se ha registrado ninguna tarjeta")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    }
                    
            
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal, 18)
                
                TotalAPagarFrameView(
                    consultPrice: consultPrice,
                    servicePrice: servicePrice,
                    finalPrice: finalPrice
                )
                .padding(18)
                
                Button(action: {
                    route.addHomeRoute(to: .confirmPayment)
                
                    print("Realizar pago")
                
                }, label: {
                    Text("Realizar pago")
                        .padding(.horizontal, 24)
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                        .kerning(1.2)
                })
                .buttonStyle(MainButtonStyle(isEnabled: isPaymentMethodCheck))
                .padding(.vertical, 12)
            }
        }
        .environmentObject(route)
    }
    
    
    
    func selectingPaymentMethod(method: PaymentMethod) -> Binding<Bool>{
        return Binding<Bool>(
                 get: { selectedPaymentMethod == method },
                 set: { isSelected in
                     if isSelected {
                         selectedPaymentMethod = method
                         isPaymentMethodCheck = true
                     } else {
                         selectedPaymentMethod = nil
                         isPaymentMethodCheck = false
                     }
                 }
             )
    }
}

#Preview {
    let test = TestData()
    
    return SchedulePayAppoinmentView(doctor: test.doctor1)
       .environmentObject(TabRouter())
}
