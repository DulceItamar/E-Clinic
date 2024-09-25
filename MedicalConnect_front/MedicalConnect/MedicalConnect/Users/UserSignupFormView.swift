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
   let typeOfSignup: TypeOfAuth
    
    var body: some View {
        VStack {
  
            
            if typeOfSignup == .EmailAuth {
                TextFieldDataView(label: "Nombre completo", prompt: "Tu nombre aquí...", keyboard: .namePhonePad, data: $name)
                    
                    .textContentType(.name)
                    .padding(.bottom, 12)
                
                TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $email)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .padding(.bottom, 12)
            } else  {
                
                GoogleUserDataFrameView(label: "Nombre completo", data: GoogleHandlerViewModel.shared.googleUser?.name ?? "No hay nombre registrado")
                    .padding(.bottom, 12)
                
                GoogleUserDataFrameView(label: "Email", data: GoogleHandlerViewModel.shared.googleUser?.email ?? "No hay correo registrado")
                
                
                
            }
            
            
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
    
    @Previewable @State var signupAccess: Bool = false
    @Previewable @State var email: String = ""
    @Previewable @State var password: String = ""
    @Previewable @State var verifiedPassword: String = ""
    @Previewable @State var name: String = ""
    @Previewable  let typeOfSingup: TypeOfAuth = .GoogleAuth
    
    
     UserSignupFormView(
        email: $email,
        password: $password,
        verifiedPassword: $verifiedPassword,
        name: $name, typeOfSignup: typeOfSingup
    )
}
