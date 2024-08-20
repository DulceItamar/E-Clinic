//
//  CardAboutDoctorView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct CardAboutDoctorView: View {
    @State var isFavorite: Bool = false
    let name: String
    let evaluation: Float
    let medicalSpeciality: String
    let servicios: [String]
    let workDays: [WorkDays]
    let numberOfConsults: Int
    let jobDescription: String
    let validations = DoctorDataValidations()
    
    var body: some View {

                
            VStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.mint)
                    .opacity(0.3)
                    .shadow(color: .black, radius: 5, x: 2, y: 10)
                    .overlay(alignment: .center) {
                            VStack{
                                
                                HStack(alignment: .top){
                                    
                                    
                                    Button(action: {
                                        isFavorite.toggle()
                                        
                                    }, label: {
                                        Image(systemName: isFavorite ? "heart.fill": "heart")
                                            .resizable()
                                            .frame(width: 24, height: 22)
                                            .frame(maxWidth: .infinity, alignment: .leading )
                                            .tint(.black)
                                    })
                                    
                               
                                        
                                    
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    
                                    Label("\(evaluation, format: .number.precision(.fractionLength(1)))/5.0", systemImage: "star.fill")
                                        .font(Font.custom("Montserrat-SemiBold", size: 16,relativeTo: .subheadline))
                                        .environment(\.layoutDirection, .rightToLeft)
                                        .frame(maxWidth: .infinity, alignment: .trailing )
                                }
                                .frame(maxWidth: .infinity, alignment: .center )
                                .padding(18)
                                
                                
                                HStack{
                                    
                                    VStack(alignment: .leading){
                                        Text(name)
                                            .font(Font.custom("Montserrat-SemiBold", size: 18, relativeTo: .title))
                                        
                                        Group {
                                            Text(medicalSpeciality)
                                                .font(Font.custom("Montserrat-Regular", size: 14, relativeTo: .subheadline))
                                            
                                            DoctorServicesCardView(services: servicios)
                                                .font(Font.custom("Montserrat-Regular", size: 12, relativeTo: .subheadline))
                                            
                                            Text("Atención: \(validations.getWorksDays(days: workDays).joined(separator: " - "))")
                                                .font(Font.custom("Montserrat-Regular", size: 14, relativeTo: .subheadline))
                                                .padding(.vertical, 10)
                                                
                                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            
                                    }
                                    .padding(.horizontal, 12)
                                    
                                    
                                    VStack {
                                        VStack{
                                            Text("No. de consultas ")
                                            Text("\(numberOfConsults, format: .number)")
                                        }
                                        .padding(8)
                                        .background(.white, in: RoundedRectangle(cornerRadius: 16))
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                        
                                        VStack{
                                            Text("Costo de consulta")
                                                
                                            Text("\(numberOfConsults, format: .currency(code: "USD"))")
                                        }
                                        .padding(8)
                                        .background(.white, in: RoundedRectangle(cornerRadius: 16))
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                    }
                                    
                                    
                                }
                                .padding(.trailing, 12)
                                
                                
                                VStack{
                                    Text("Sobre mí:")
                                        .frame(maxWidth: .infinity, alignment: .leading )
                                        .font(Font.custom("Montserrat-semiBold", size: 14))
                                        .padding(.bottom, 8)
                                    
                                    Text(jobDescription)
                                        .frame(maxWidth: .infinity)
                                    
                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                    
                                }
                                .padding(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 12))
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                            .padding(.horizontal, 12)
                            .frame(height: 450)
            }
        
    }
}

#Preview {
    CardAboutDoctorView(
        name: "Josefina Díaz",
        evaluation: 4.78,
        medicalSpeciality: MedicalSpeality.pediatrics.rawValue,
        servicios: ["Cardiología pediátrica", "Endocrinología pediátrica"],
        workDays: [ WorkDays.monday, WorkDays.tuesday, WorkDays.wednesday],
        numberOfConsults: 33,
        jobDescription: "Hace más de 10 años que practico medicina pediátrica y me apasiona trabajar con niños, poder contribuir a su salud se ha convertido en la pasión de mi vida. Me he especializado en pediatría y luego elegí la cardiología para poder cuidar y curar los corazones del mañana. ¡Gracias por elegirme!"
    )
}
