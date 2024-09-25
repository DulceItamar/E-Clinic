//
//  GoogleUserDataFrameView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 23/09/24.
//

import SwiftUI

struct GoogleUserDataFrameView: View {
    let label: String
    let data: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(Font.custom("Montserrat-SemiBold", size: 14))
            
            Text(data)
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(RoundedTextFormatStyle())
                
               
        }
       
    }
}

struct RoundedTextFormatStyle: ViewModifier {

    var border: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
        
            .stroke(Color("babyBlue-300"), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
           
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .foregroundStyle(.gray)
            .font(Font.custom("Montserrat-Regular", size: 14))
            .padding(8)
            .background(border)
          
    }
    
}



#Preview {
    GoogleUserDataFrameView(label: "Nombre", data: "Dulce Vigueras")
}
