//
//  PatientDataFrameView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 29/07/24.
//

import SwiftUI

struct PatientDataFrameView: View {
    let name: String
    let age: Int
    let hasAllergies: Allergies
    let gender: Gender
    let appointmentsMade: Int
    
    
    var body: some View {

        VStack{
            
            
            RoundedRectangle(cornerRadius: 12)
                .fill(.backgroundRows200)
                .shadow(color: .main, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center) {
                    
                    HStack(alignment: .center){
                        
                        VStack(alignment: .leading) {
                            Text("Alergias")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
                            
                            Text("Género")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
                            
                            Text("Consultas realizadas")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
    
                            
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.bottom,10)
                        
                        VStack(alignment: .trailing) {
                            Text(hasAllergies.rawValue)
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
                            
                            Text(gender.rawValue)
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
                            
                            Text("\(appointmentsMade)")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(.bottom,10)
    
                            
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .padding(.bottom,10)
    

                    }
                    .padding(.horizontal,12)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                }
                .frame(height: 180)
                .offset(CGSize(width: 0.0, height: 80.0))
                
            
            
            HStack{
                VStack(alignment: .leading){
                    
                    Text(name)
                        .font(Font.custom("Montserrat-Bold", size: 18))
                    Text("\(age, format: .number) años")
                        .font(Font.custom("Montserrat-Regular", size: 14))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                    .padding(12)
            }
            .padding(.horizontal, 16)
            .background(.main)
           
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 2, y: 2)
            .offset(CGSize(width: 0.0, height: -200.0))
            
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(16)
       
        

    }
}

#Preview {
    PatientDataFrameView(
        name: "Carina Sosa",
        age: 38,
        hasAllergies: Allergies.no,
        gender: Gender.FEMALE,
        appointmentsMade: 3
    )
}
