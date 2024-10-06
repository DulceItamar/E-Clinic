//
//  RootView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var auth: UserSession
 //   @EnvironmentObject private var onboarding: OnboardingRouter
    var body: some View {
        Group {
            if auth.isLoggedIn {
//                ExternalRoutes.login
                MainTabView(selectedTabView: .home)
                
            } else {
//                ExternalRoutes.logout
                OnboardingView()
            }
        }
       // .environmentObject(onboarding)
//        .onAppear {
//            auth.loggedIn = auth.hasAccessToken()
//        }
    }
}

#Preview {
    RootView()
}
