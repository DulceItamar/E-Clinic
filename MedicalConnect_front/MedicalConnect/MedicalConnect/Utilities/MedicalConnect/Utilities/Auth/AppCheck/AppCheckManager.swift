//
//  AppCheckManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 17/09/24.
//

import Foundation
import Firebase
import Combine
import FirebaseAppCheck



enum TokenError: Error {
    case error(_ with: String)
}
public protocol AppCheckManaging: AppCheckProviderFactory {}

final class AppCheckManager: NSObject, AppCheckManaging {
    
    static let shared = AppCheckManager()
    
    
    //To set AppCheckManager factory to be used as an attestion provider factory.
    func createProvider(with app: FirebaseApp) ->  AppCheckProvider? {
        
        #if DEBUG
        // App Attest is not available on debug builds and/or simulators.
                return AppCheckDebugProvider(app: app)
        #else
                // Use App Attest provider on release builds and/or real devices.
                return AppAttestProvider(app: app)
        #endif
        
       
    }
    
    //Provide us with an App Check Token that we can include in our request to backend server for verification purposes. This method should only be used if you need to autorize request to a non-Firebase backend. Request to Firebase backend are autorized automatically if configured.
    func genereTokenAppCheck() -> Future<String, TokenError> {
        Future<String, TokenError> { promise in
            //Setting forcingRefresh to true will force request Firebase App Check App Token ignoring the cached token. Otherwise, setting it to false will let App Check framework use cached token if it exists and has not expired yet. In most cases false is preferred. true should only be used if the server explicitly returns an error, indicating a revoked token.
            AppCheck.appCheck().token(forcingRefresh: false) { token, error in
                if let error {
                    promise(.failure(.error(error.localizedDescription)))
                    return
                }
                guard let tokenref = token else { return }
                promise(.success(tokenref.token))
            }
        }
    }
    
    //SetAppCheckManager instance itself as a provider factory for App Check framework.
    func setProviderFactory(){
        AppCheck.setAppCheckProviderFactory(self)
    }
    
}
