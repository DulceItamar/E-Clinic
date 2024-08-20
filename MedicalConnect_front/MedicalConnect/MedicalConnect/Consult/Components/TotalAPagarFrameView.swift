//
//  TotalAPagarFrameView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI

struct TotalAPagarFrameView: View {
    let consultPrice: Float
    let servicePrice: Float
    let finalPrice: Float
    var body: some View {
        VStack{
    
            
            RoundedRectangle(cornerRadius: 12)
                .fill(.backgroundRows200)
                .shadow(color: .main, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center) {
                    
                    VStack{
                        Text("TOTAL A PAGAR")
                            .font(Font.custom("Montserrat-semiBold", size: 16))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                            .padding(14)
                            .background(.mint)
                        
                        HStack(alignment: .center){
                            
                            VStack(alignment: .leading) {
                                
                       
                                   
                                
                                Group {
                                    Text("Atención del médico")
                                        .padding(.bottom,16)
                                        
                                    
                                    Text("Tarifa de servicio")
                                        .padding(.bottom,16)
                                    
                                    Text("Valor final ")
                                        .padding(.bottom,16)
                                        .bold()
                                    
                                }
                                .font(Font.custom("Montserrat-Regular", size: 14))

                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.bottom,10)
                            
                            
                            VStack(alignment: .trailing) {
                                
                                
                                Group {
                                    Text("\(consultPrice, format: .currency(code: "USD"))")
                                        .padding(.bottom,16)
                                    

                                    
                                    Text("\(servicePrice, format: .currency(code: "USD"))")
                                        .padding(.bottom,16)
                                    
                                    Text("\(finalPrice, format: .currency(code: "USD"))")
                                        .padding(.bottom,16)
                                        .bold()
                                    

                                }
                                .font(Font.custom("Montserrat-Regular", size: 14))

                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                            .padding(.bottom,10)
                        }
                        .padding(.horizontal,12)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    }
                    
 

                    
      
                }
                .frame(height: 170)
               
        }
    }
}

#Preview {
    TotalAPagarFrameView(consultPrice: 15, servicePrice: 2, finalPrice: 17)
}
