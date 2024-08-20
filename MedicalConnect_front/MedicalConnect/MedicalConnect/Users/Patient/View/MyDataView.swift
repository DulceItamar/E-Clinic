//
//  MyDataView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 30/07/24.
//

import SwiftUI

struct MyDataView: View {
    let test = TestData()
    
    
    var body: some View {
        VStack {
            MyDataFrameView(
                name: test.patient1.user.name,
                birthdate: test.patient1.birthdate,
                phone: test.patient1.user.phone,
                email: test.patient1.user.email,
                password: test.patient1.user.password
            )
            
            Button(action: {
                print("Editar datos")
            }, label: {
                Text("Editar datos")
                    .padding(.horizontal, 24)
                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                    .kerning(1.2)
            })
            .buttonStyle(MainButtonStyle(isEnabled: true))
            .padding(.vertical, 32)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 16)
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Mis datos")
    }
}

#Preview {
    MyDataView()
}
