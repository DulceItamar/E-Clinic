//
//  TextFieldDataView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI

struct TextFieldDataView: View {
    let label: String
    let prompt: String
    let keyboard: UIKeyboardType
    @Binding var data: String
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(Font.custom("Montserrat-SemiBold", size: 14))
            
            TextField("", text: $data, prompt: Text(prompt))
                .keyboardType(keyboard)
                .autocorrectionDisabled()
                .textFieldStyle(RoundedTextFieldStyle())
               
        }
      
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {

    @State var data:String = "Hola"
    return  TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $data)
}



struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
           
            .multilineTextAlignment(.leading)
            .foregroundStyle(.black)
            .font(Font.custom("Montserrat-Regular", size: 14))
            .padding(8)
            .background(border)
    }
    
    var border: some View {
 
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .stroke(Color("babyBlue-300"), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
    }
    
}


