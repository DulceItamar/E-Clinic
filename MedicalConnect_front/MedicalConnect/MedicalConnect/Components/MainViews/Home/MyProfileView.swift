//
//  MyProfileView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct MyProfileView: View {
    
    let allMenus : [MyMenu] = [
        .init(title: .myData),
        .init(title: .myAppointments),
        .init(title: .myStudies),
        .init(title: .treatments)
    
    ]
    
    @EnvironmentObject private var router: TabRouter
    @EnvironmentObject private var onboardingRouter: OnboardingRouter
    
    var body: some View {
       
//        $router.profileStack
//        NavigationStack(path: $onboardingRouter.routes ){
                
//                Text("Mi Perfil")
//                    .font(Font.custom("Montserrat-Bold", size: 20))
//                    .padding(16)
//                    .foregroundStyle(.white)
//                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                    .background(.main)
        VStack {
            
            UpperFrame(label: "Mi Perfil")
            List {
                ForEach(allMenus, id: \.title){ option in
                    NavigationLink(value: AppRoute.profile(.details(item: option))) {
                        Text(option.title.rawValue)
                    }
                    .frame(height: 40)
                    
                    
                }
                
            }
        }
        .navigationTitle("Mi Perfil")
        .font(Font.custom("Montserrat-Regular", size: 16))
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
       // .navigationDestination(for: AppRoute.self, destination: { $0 })
        .listStyle(InsetListStyle())
                
//            }
        .environmentObject(onboardingRouter)

    }
}

#Preview {
    @Previewable @State var route = NavigationPath()
    return MyProfileView()
        .environmentObject(OnboardingRouter())
}
