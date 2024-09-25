//
//  GoogleSignInError.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 17/09/24.
//

import Foundation

enum GoogleSignInError: Error, LocalizedError {
    case clientIDNotFound
    case viewControllerNotFound
    case signInFailed
    case idTokenNotFound
    case userProfileNotFound
    case firebaseAuthenticationFailed
    
    var errorDescription: String?{
        switch self {
            case .clientIDNotFound:
                return "No se puede encontrar el Client Id"
            case .viewControllerNotFound:
                return "No se pudo obtener el View Controller para presntar el flujo de inicio de sesión"
            case .signInFailed:
                return "El inicio de sesión con Google falló"
            case .idTokenNotFound:
                return "No se pudo obtener el ID Token del usuario"
            case .userProfileNotFound:
                return "No se pudo obtener el perfil del usuario"
            case .firebaseAuthenticationFailed:
                return "No se pudo autenticar el usuario con Firebase"
        }
    }
}
