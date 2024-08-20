//
//  OnboardingManager.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/08/24.
//

import Foundation

class OnboardingManager: ObservableObject {
    
    @Published var nextView: Bool = false
    
    final func navigateToNextView() {
        nextView = true
    }
    
}
