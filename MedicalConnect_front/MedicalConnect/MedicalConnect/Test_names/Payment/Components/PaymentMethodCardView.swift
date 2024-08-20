//
//  PaymentMethodsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI

struct PaymentMethodCardView: View {
    let paymentName: String

    @Binding var checked : Bool
    
    var body: some View {
  
            
      
                
                
                Label(paymentName, systemImage: checked ? "checkmark.circle": "circle")
                    .padding(.bottom, 10)
                    .font(Font.custom(checked ?"Montserrat-semiBold": "Montserrat-Regular" , size: 14))
                    .onTapGesture {
                        withAnimation {
                            self.checked.toggle()
                        }
                        
                    }
                    

                
                
            
        
       
    }
}

#Preview {

    @State var checked : Bool = false
    return PaymentMethodCardView(paymentName: "Mastercard 1454", checked: $checked)
}
