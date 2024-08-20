//
//  MedicalConnectApp.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 25/07/24.
//

import SwiftUI

@main
struct MedicalConnectApp: App {
<<<<<<< HEAD
    var body: some Scene {
        WindowGroup {
            ContentView()
=======
    let routeManager = TabRouter()
    let onboardingRouter = OnboardingRouter()
    var body: some Scene {
        WindowGroup {
            //StartingView()
            
//            MainTabView(router: TabRouter())
            MainTabView()
                .environmentObject(routeManager)
                .environmentObject(onboardingRouter)
          //  SignUpView()
//            OnboardingView()
//                .environmentObject(routeManager)
            
          
>>>>>>> dev_mobile2
        }
    }
}
