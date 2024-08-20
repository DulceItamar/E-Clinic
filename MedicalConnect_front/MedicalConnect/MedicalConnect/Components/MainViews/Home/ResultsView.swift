//
//  ResultsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct ResultsView: View {
    let example = TestData()
    let showData = DoctorDataValidations()

    var body: some View {
        VStack {
            NavigationStack {
                UpperFrame(label: "Resultados")
                
                ScrollView{
                    ForEach(example.doctors, id:\.self){ doctor in
                        
                        
                        NavigationLink(value: doctor) {
                            DoctorRowView(doctor: doctor)
                        }
//                        .navigationDestination(for: Doctor.self) { doctor in
//                            
//                            ProfileDocView(doctor: doctor)
//
//        
//                        }
                        .tint(.black)
                  
                     
                          
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ResultsView()
}
