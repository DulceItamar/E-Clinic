//
//  NotificationsView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Notificaciones")
        }
        .padding()
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Notificaciones")
        
    }
}

#Preview {
    NotificationsView()
}
