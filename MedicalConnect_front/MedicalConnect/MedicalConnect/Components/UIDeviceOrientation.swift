//
//  UIDeviceOrientation.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import Foundation
import UIKit
extension UIDeviceOrientation {
    var isLanScape: Bool {
        switch self {
         
            case .portrait:
                return false
            case .portraitUpsideDown:
                return false
            case .landscapeLeft:
                return true
            case .landscapeRight:
                return true
            case .faceUp:
                return false
            case .faceDown:
                return false 
            case .unknown:
                return false
            @unknown default:
                return false
        }
    }
}
