//
//  TextFieldSecurityView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI


struct TextFieldSecurityView: View {
    @Binding var password: String
    let label: String
    let prompt: String
    let keyboard: UIKeyboardType
    
    @FocusState var focusedField: SecurityFieldTextFieldData?

    @State var showPassword: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(Font.custom("Montserrat-SemiBold", size: 14))
            
            ZStack(alignment: .trailing) {
                
                if !showPassword {
                    showSecuredTextField
                   
                } else {
                    securedTextField
                }
                
                
                Button {
                    performToggle()
                } label: {
                    Image(systemName: self.showPassword ? "eye.slash" : "eye")
                        
                }
                .tint(.gray)
                .padding(.trailing, 10)

            
            }
        }
    //    .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 10))
        .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    var securedTextField: some View {
   
            SecureField("", text: $password, prompt: Text(prompt))
                .textInputAutocapitalization(.never)
                .keyboardType(keyboard)
                .autocorrectionDisabled()
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focusedField, equals: .hidePassword)

    }
    
    var showSecuredTextField: some View {
   
        TextField("", text: $password, prompt: Text(prompt))
            .keyboardType(keyboard)
            .autocorrectionDisabled()
            .textFieldStyle(RoundedTextFieldStyle())
            .focused($focusedField, equals: .hidePassword)

    }
    
    
    func performToggle(){
        showPassword.toggle()
        if showPassword {
            focusedField = .hidePassword
        } else {
            focusedField = .showPassword
        }
    }
}

#Preview {
    
    @State var password: String = ""
    return TextFieldSecurityView( password: $password, label: "Contraseña", prompt: "Contraseña", keyboard: .asciiCapable)
}
