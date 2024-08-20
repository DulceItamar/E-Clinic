//
//  DoctorReviewsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 28/07/24.
//

import SwiftUI

struct DoctorReviewCardView: View {
    
    let name: String
    let evaluation: Float
    let review: String
        
    var body: some View {

                
                    VStack(alignment: .leading, spacing: 8){
                        
                        HStack{
                            Text(name)
                                .font(Font.custom("Montserrat-semiBold", size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(evaluation, format: .number.precision(.fractionLength(1)))")
                                .font(Font.custom("Montserrat-semiBold", size: 18))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                        
                        
                        Text(review)
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    .padding(12)
                    
                    .background(.backgroundRows100)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .mint, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 350)

    }
}

#Preview {

     DoctorReviewCardView(name: "Giuliana Giraud", evaluation: 5.0, review: "El Dr. Martínez ha sido un verdadero salvavidas para mí. Después de años de lucha con problemas de tiroides, finalmente encontré a un especialista que no solo es extremadamente conocedor, sino también empático y paciente. Durante cada consulta, se toma el tiempo para explicar cada detalle de mi tratamiento y responder todas mis preguntas. ")
}
