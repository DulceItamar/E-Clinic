//
//  RootView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct RootView: View {
    private let auth = UserSession.shared
    var body: some View {
        Group {
            if auth.isLoggedIn {
                ExternalRoutes.login
                //MainTabView(selectedTabView: .home)
            } else {
                ExternalRoutes.logout
            }
        }
//        .onAppear {
//            auth.loggedIn = auth.hasAccessToken()
//        }
    }
}

#Preview {
    RootView()
}
