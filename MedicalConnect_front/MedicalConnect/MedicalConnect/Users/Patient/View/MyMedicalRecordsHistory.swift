//
//  MyScheduledAppointmentsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import SwiftUI

struct MyMedicalRecordsHistory: View {
    var body: some View {
        
        VStack{
            Text("Mis citas realizadas")
        }
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Mis consultas")
    }
}

#Preview {
    MyMedicalRecordsHistory()
}
