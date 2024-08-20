//
//  BigFrameTextFieldView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI





struct BigFrameTextFieldView: View {
    let label: String
    let prompt: String
    let keyboard: UIKeyboardType
    @State var data: String = ""
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(Font.custom("Montserrat-SemiBold", size: 14))
            
            ZStack(alignment: .topLeading, content: {
                if data.isEmpty {
                    Text(prompt)
                        .foregroundColor(.gray)
                        .padding(12)
                        .font(Font.custom("Montserrat-Regular", size: 14))
                }
                
                TextEditor(text: $data)
                    .keyboardType(keyboard)
                    .autocorrectionDisabled()
                    .scrollContentBackground(.hidden)
                    .padding()
                    .foregroundStyle(.black)
                    .frame(height: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .opacity(0.4)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("babyBlue-300"), lineWidth: 1.0)
                            )
                    )
                
            })
            

        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
        .frame(maxWidth: .infinity, alignment: .leading)
 
    }
}








#Preview {
    BigFrameTextFieldView(label: "Tengo alergias a ...", prompt: "Tengo alergia a...", keyboard: .alphabet)
}
