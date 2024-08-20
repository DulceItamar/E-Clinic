//
//  DoctorServicesCardView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct DoctorServicesCardView: View {
    let services: [String]
    var body: some View {
        
        VStack(alignment: .leading){
            ForEach(services, id: \.self) { service in
                Text(service)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                   
                    
            }
        } 
    }
}

#Preview {
     DoctorServicesCardView(services: ["Cardiología pediátrica", "Nefrología pediátrica"])
}
