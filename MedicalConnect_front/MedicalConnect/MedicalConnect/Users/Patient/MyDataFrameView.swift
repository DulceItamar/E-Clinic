//
//  MyDataFrameView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

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
