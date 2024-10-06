//
//  HomeView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI


struct HomeView: View {
   
    let example = TestData()
    let showData = DoctorDataValidations()
    @State private var searchDoctorBySpeciality: Bool = false

    
    @EnvironmentObject private var router: TabRouter
    @EnvironmentObject private var onboardingRouter: OnboardingRouter
    
    
    var body: some View {
        //$router.homeStack
        NavigationStack(path: $onboardingRouter.routes) {
            GeometryReader { geometry in
                VStack {
                    UpperFrame(label: "Encuentra el profesional que necesitas")
                    
                    Button {
                        searchDoctorBySpeciality = true
                     
                        print("Buscar medicos")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray)
                                .opacity(0.2)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.secondary)
                                Text("Buscar por especialidad")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 42)
                        .padding(.horizontal, 10)
                    }
                    .tint(.gray)
                    .fullScreenCover(isPresented: $searchDoctorBySpeciality, content: {
                        SearchingDoctorView()
                    })
                    
                    ScrollView {
                        HeaderView(title: "Últimos médicos agregados")
                        
                        ForEach(example.doctors, id: \.self) { doctor in
                            
                            NavigationLink(value: AppRoute.home(.details(doctor: doctor))) {
                                // HomeRoute.details(doctor: doctor)
                                
                                DoctorRowView(doctor: doctor)
                            }
                        }
                    }
                    .tint(.black)
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .navigationDestination(for: AppRoute.self, destination: { $0 })
        }
        .environmentObject(onboardingRouter)
    }
}


#Preview {
    @Previewable @State var path: NavigationPath = .init()
    return HomeView()
        .environmentObject(OnboardingRouter())
}
