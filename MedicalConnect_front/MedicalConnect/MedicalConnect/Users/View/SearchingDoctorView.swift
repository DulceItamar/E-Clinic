//
//  SearchingDoctorView().swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI

struct SearchingDoctorView: View {
    @Environment(\.dismiss) private var dismiss
    let medicalSpecialties: [String] = [
        MedicalSpeality.cardiology.rawValue,
        MedicalSpeality.dermatology.rawValue,
        MedicalSpeality.endocrinology.rawValue,
        MedicalSpeality.gastroenterology.rawValue,
        MedicalSpeality.geriatrics.rawValue,
        MedicalSpeality.gynecology.rawValue,
        MedicalSpeality.hematology.rawValue,
        MedicalSpeality.immunology.rawValue,
        MedicalSpeality.nephrology.rawValue,
        MedicalSpeality.neurology.rawValue,
        MedicalSpeality.oncology.rawValue,
        MedicalSpeality.orthopedics.rawValue,
        MedicalSpeality.pediatrics.rawValue,
        MedicalSpeality.psychiatry.rawValue,
        MedicalSpeality.pulmonology.rawValue,
        MedicalSpeality.radiology.rawValue,
        MedicalSpeality.rheumatology.rawValue,
        MedicalSpeality.urology.rawValue
    ]
    
    @State var searchDoctor: String = ""
    
    var filteredName: [String] {
        if searchDoctor.isEmpty {
            medicalSpecialties
        } else {
            medicalSpecialties.sorted().filter { $0.lowercased().contains(searchDoctor.lowercased())}
        }
    }

    var body: some View {
 
            
           
            
            NavigationStack {

                List {
                    
                    Section {
                        ForEach(medicalSpecialties, id: \.self) { speciality in
                            
                            NavigationLink{
                                Text(speciality)
                            } label: {
                                Text(speciality)
                            }
                        }
                    } header: {
                        Text("Sugerencias")
                    }
                    
               
                }
                .searchable(text: $searchDoctor, prompt: Text("Especialidad"))
                .searchable(text:$searchDoctor){
                    ForEach(filteredName, id: \.self){ suggestion in
                        
//                        Button {
//                            print(suggestion)
//                        } label: {
//                            Text(suggestion)
//                        }
                        
                        NavigationLink{
                            Text(suggestion)
                        } label: {
                            Text(suggestion)
                        }
                           
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cerrar") {
                              dismiss()
                          }
                    }
                }
                
                
                
            }
        
            
            
            
            Spacer()
          

       
  
     
    }
    

    

}

#Preview {
    SearchingDoctorView()
}
