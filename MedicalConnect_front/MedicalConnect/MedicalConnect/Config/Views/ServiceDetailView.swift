//
//  ServicesDetailView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/08/24.
//

import SwiftUI
//
struct ServiceDetailView: View {
    
    let service: Service
    var body: some View {
        VStack {
            Text(service.title.rawValue)
            
        }
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle(service.title.rawValue)
    }
}

#Preview {
    let test = TestData()
    return ServiceDetailView(service: test.service)
}
