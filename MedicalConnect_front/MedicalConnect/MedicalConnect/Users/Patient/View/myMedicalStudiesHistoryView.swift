//
//  myMedicalStudiesHistoryView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI

struct myMedicalStudiesHistoryView: View {
    var body: some View {
        
        VStack{
            Text("Mis estudios médicos")
        }
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Mis estudios")
      
    }
}

#Preview {
    myMedicalStudiesHistoryView()
}
