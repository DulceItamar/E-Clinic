//
//  SignInWithAppleButtonStyle.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import Foundation
import SwiftUI

struct SignInWithAppleButtonStyle: ButtonStyle {
    var isEnabled : Bool

    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background( isEnabled ? .black : Color(red: 240/255, green: 240/255, blue: 240/255))
            .foregroundStyle(isEnabled ? .white : Color(red: 175/255, green: 178/255, blue: 181/255))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .scaleEffect(isEnabled ? (configuration.isPressed ? 1.5 : 1) : (configuration.isPressed ? 1: 1 ))
            .animation( isEnabled ? .easeOut(duration: 0.4) : .easeOut(duration: 0.0), value: configuration.isPressed)
        
        
    }
}
