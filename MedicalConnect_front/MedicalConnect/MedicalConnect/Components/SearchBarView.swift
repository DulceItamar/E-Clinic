//
//  SearchBarView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct SearchBarView: View {
    let prompt: String
    let keyboard: UIKeyboardType
    @Binding var data: String
    var body: some View {
        
    
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .opacity(0.2)
                  
            
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("", text: $data, prompt: Text(prompt))
                        .keyboardType(keyboard)
                        .autocorrectionDisabled()
                        

                }.padding(.horizontal, 8)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 42)
            .padding(.horizontal, 10)
        
    }}

#Preview {
    @State var data: String = ""
    return SearchBarView( prompt: "Busca por especialidad", keyboard: .asciiCapable, data: $data)
}


