//
//  ContactView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack{
            Text("Si tienes alguna pregunta sobre estos Términos y Condiciones, puedes ponerte en contacto con nosotros a través de:")
            
            Text("Correo electrónico: admon.contact@econnect.com]")
            
        }
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Contacto")
    }
}

#Preview {
    ContactView()
}
