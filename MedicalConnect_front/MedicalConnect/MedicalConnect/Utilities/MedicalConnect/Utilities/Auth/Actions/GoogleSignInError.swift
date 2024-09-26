/// `GoogleSignError` is s an enum that represents various errors that can occur during the Google Sign-In process or Firebase authentication. Each case in the enum corresponds to a specific error scenario, and the errorDescription property provides localized error messages.

import Foundation

enum GoogleSignInError: Error, LocalizedError {
    case clientIDNotFound
    case viewControllerNotFound
    case signInFailed
    case idTokenNotFound
    case userProfileNotFound
    case firebaseAuthenticationFailed
    case signInCancelled
    
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
            case .signInCancelled:
                return "Autenticación cancelada por el usuario"
        }
    }
}
