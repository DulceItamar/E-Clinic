//
//  MyAppointmentsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import SwiftUI

struct MyAppointmentsHistoryView: View {
    var body: some View {
        VStack{
            Text("Mis citas")
        }
       
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Mis citas")
        
        
    }
    
}

#Preview {
    MyAppointmentsHistoryView()
}
