//
//  PatientView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI

struct UserSignupFormView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var verifiedPassword: String
    @Binding var name: String
    var body: some View {
        VStack {
  
            
            TextFieldDataView(label: "Nombre completo", prompt: "Tu nombre aquí...", keyboard: .namePhonePad, data: $name)
                
                .textContentType(.name)
                .padding(.bottom, 12)
            
            TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $email)
                .textInputAutocapitalization(.never)
                .textContentType(.emailAddress)
                .padding(.bottom, 12)
            
            TextFieldSecurityView(password: $password, label: "Contraseña", prompt: "Escribe una contraseña", keyboard: .asciiCapable)
                .textContentType(.newPassword)
                .padding(.bottom, 12)
            
            TextFieldSecurityView(password: $verifiedPassword, label: "Repite Contraseña", prompt: "Repite tu contraseña", keyboard: .asciiCapable)
                .textContentType(.newPassword)
                .padding(.bottom, 32)
            

            
        }
    }
}

#Preview {
    
    @State var signupAccess: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var verifiedPassword: String = ""
    @State var name: String = ""
    
    
    return UserSignupFormView(
        email: $email,
        password: $password,
        verifiedPassword: $verifiedPassword,
        name: $name
    )
}
