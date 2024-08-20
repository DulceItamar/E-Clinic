//
//  HeaderView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        
        VStack {
            Text(title)
                .font(Font.custom("Montserrat-Regular", size: 20))
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(.horizontal, 12)
       
            
    }
}

#Preview {
    HeaderView(title: "Últimos médicos agregados")
}
