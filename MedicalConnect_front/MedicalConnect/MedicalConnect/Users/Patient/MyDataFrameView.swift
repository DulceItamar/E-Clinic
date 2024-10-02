/// `MyDataFrameView` is a SwiftUI View that presents detailed information about a user, including their name, birthdate, phone number, email, and password. The view uses a rounded rectangle background and displays the user information in a well-organized layout.
///- Parameters:
///  - name: The name of the patient.
///  - birthdate: The birthdate of the user, stored as a Date object.
///  - phone: The user's phone number.
///  - email: The user's email number.
///  - password: The user's password (consider hiding or obfuscating this in production apps for security).

import SwiftUI

struct MyDataFrameView: View {
    
    let name: String
    let birthdate: Date
    let phone: String
    let email: String
    let password: String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(.backgroundRows200)
                .shadow(color: .main, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center) {
                    
                    HStack(alignment: .center){
                        
                        VStack(alignment: .leading) {
                            
                            
                            Group {
                                Text("Nombre")
                                    .padding(.bottom,16)
                                    
                                
                                Text("Fecha de nacimiento")
                                    .padding(.bottom,16)
                                
                                Text("Teléfono")
                                    .padding(.bottom,16)
                                
                                Text("Email")
                                    .padding(.bottom,16)
                                
                                Text("Contraseña")
                                    .padding(.bottom,16)
                            }
                            .font(Font.custom("Montserrat-semiBold", size: 14))

                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.bottom,10)
                        
                        
                        VStack(alignment: .trailing) {
                            
                            
                            Group {
                                Text(name)
                                    .padding(.bottom,16)
                                
                                Text("\(birthdate, format: .dateTime)")
                                    .padding(.bottom,16)
                                
                                Text(phone)
                                    .padding(.bottom,16)
                                
                                Text(email)
                                    .padding(.bottom,16)
                                
                                Text(password)
                                    .padding(.bottom,16)
                            }
                            .font(Font.custom("Montserrat-Regular", size: 14))

                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .padding(.bottom,10)
                    }
                    .padding(.horizontal,12)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                }
                .frame(height: 280)
               
        }
    }
}

#Preview {
    MyDataFrameView(
        name: "Carina Muriel Sosa",
        birthdate: .now,
        phone: "354-526-486",
        email: "ejemplo@gmail.com",
        password: "123456"
    )
}
