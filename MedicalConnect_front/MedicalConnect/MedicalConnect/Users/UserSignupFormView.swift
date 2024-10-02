///`UserSignupFormView` is a SwiftUI view that displays a signup form for user registration.
/// The form supports two types of signups: Email authentication and Google authentication. Depending on the signup type, it either displays text fields for manual input or prefilled data from Google sign-in.
/// - Parameters:
///   - email: A binding to the email address entered by the user.
///   - password: A binding to the password entered by the user.
///   - verifiedPassword: A binding to the repeated password entered by the user.
///   - name: A binding to the user's full name.
///   - typeOfSignup: The type of authentication method (email or Google).

import SwiftUI

struct UserSignupFormView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var verifiedPassword: String
    @Binding var name: String
   let typeOfSignup: TypeOfAuth
    
    var body: some View {
        VStack {
            
            
            // Display different forms based on the type of signup
            if typeOfSignup == .EmailAuth {
                
                
                //Email signup form
                TextFieldDataView(label: "Nombre completo", prompt: "Tu nombre aquí...", keyboard: .namePhonePad, data: $name)
                    .textContentType(.name)
                    .padding(.bottom, 12)
                
                
                TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $email)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .padding(.bottom, 12)
                
                
                // Common password and verified password fields for both signup types
                TextFieldSecurityView(password: $password, label: "Contraseña", prompt: "Escribe una contraseña", keyboard: .asciiCapable)
                    .textContentType(.newPassword)
                    .padding(.bottom, 12)
                
                TextFieldSecurityView(password: $verifiedPassword, label: "Repite Contraseña", prompt: "Repite tu contraseña", keyboard: .asciiCapable)
                    .textContentType(.newPassword)
                    .padding(.bottom, 32)
                
            } else  {
                
                
                //Google signup form with prefilled data
                GoogleUserDataFrameView(label: "Nombre completo", data: GoogleHandlerViewModel.shared.googleUser?.name ?? "No hay nombre registrado")
                    .padding(.bottom, 12)
                
                
                GoogleUserDataFrameView(label: "Email", data: GoogleHandlerViewModel.shared.googleUser?.email ?? "No hay correo registrado")
            }
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
