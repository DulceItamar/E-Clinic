//
//  ConfigView.swift
//  MedicalConnect
//
// Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct ConfigView: View {
   private let configServices: [Service] = [
        
        .init(title: .notifications ),
        .init(title: .payment),
        .init(title: .auth),
        .init(title: .termsAndconditions),
        .init(title:  .privacy),
        .init(title:  .contact),
            
    ]
    private let userSession = UserSession.shared
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
 //   @EnvironmentObject private var router: TabRouter
    @EnvironmentObject private var onboardingRouter: OnboardingRouter
    

    var body: some View {

//        $router.settingStack
//        NavigationStack(path: $onboardingRouter.routes) {
            VStack {
                UpperFrame(label: "Configuración")
                
                List {
                    ForEach(configServices) { service in
//                        SettingRoute.details(item: service)
                        NavigationLink(value: AppRoute.settings(.details(item: service))) {
                            Text(service.title.rawValue)
                                
                        }
                        .frame(height:40)
                       
                    }
                   
                    
                    Button("Cerrar sesión") {
                        showAlert = true
                    }
                    .buttonStyle(.plain)
                    .frame(height:40)
                    .alert("¿Desea cerrar sesión?", isPresented: $showAlert) {
                        Button("Sí") {
                            userSession.logout()
                            
                            onboardingRouter.popToRoot()
                            
                            print("Cerrando sesión")
                        }
                        Button("No", role: .cancel) {
                            dismiss()
                        }
                    }
                }
                .listStyle(InsetListStyle())
            
            
        }
       
       
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Configuración")
        .font(Font.custom("Montserrat-Regular", size: 16))
     //   .navigationDestination(for: AppRoute.self, destination: { $0 })
       
       
//        }
     
        //.environmentObject(onboardingRouter)

    }
}

#Preview {
   // @Previewable @State var path = NavigationPath()
    return ConfigView()
        .environmentObject(OnboardingRouter())
}
