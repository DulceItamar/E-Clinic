//
//  MedicalConnectApp.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 25/07/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAppCheck
import FirebaseAuth
import GoogleSignIn



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    // Configurar Firebase y habilitar App Check en modo de depuración

    
    
    func configureFirebaseAppCheck() -> Bool {
    
        #if DEBUG
        // Habilitar App Check Debug Provider para el simulador o desarrollo
        AppCheckManager.shared.setProviderFactory()
        #endif
        

        FirebaseApp.configure()
        return true
    }
}

@main
struct MedicalConnectApp: App {
    //Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var userSession = UserSession.shared
    let onboardingRouter = OnboardingRouter()
   
    var body: some Scene {
        WindowGroup {

           // OnboardingView()
            RootView()
                .environmentObject(userSession)
                .environmentObject(onboardingRouter)
              
            
          

        }
    }
}
