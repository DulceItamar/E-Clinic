//
//  ConfigView.swift
//  MedicalConnect
//
// Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct ConfigView: View {
    let configServices: [Service] = [
        
        .init(title: .notifications ),
        .init(title: .payment),
        .init(title: .auth),
        .init(title: .termsAndconditions),
        .init(title:  .privacy),
        .init(title:  .contact),
            .init(title: .logout)
    ]
    
    @EnvironmentObject private var router: TabRouter

    var body: some View {

        
        NavigationStack(path: $router.settingStack) {
            
//            Text("Configuración")
//                .font(Font.custom("Montserrat-Bold", size: 20))
//                .padding(16)
//                .foregroundStyle(.white)
//                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                .background(.main)
            
            List(configServices) { service in
                
                NavigationLink(value: SettingRoute.details(item: service)) {
                    Text(service.title.rawValue)
                }
                .frame(height:40)

        }
        .navigationTitle("Configuración")
        .font(Font.custom("Montserrat-Regular", size: 16))
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationDestination(for: SettingRoute.self, destination: { screen in
            switch screen {
                case .details(item: let service):
                    ServiceDetailView(service: service)
                
            }
        })

        .listStyle(InsetListStyle())
        }
        .environmentObject(router)


            

    }
}

#Preview {
    @State var path = NavigationPath()
    return ConfigView()
        .environmentObject(TabRouter())
}
