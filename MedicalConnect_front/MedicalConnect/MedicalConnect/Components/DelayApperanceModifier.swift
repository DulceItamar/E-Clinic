//
//  DelayApperanceModifier.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 25/09/24.
//

import Foundation
import SwiftUI

struct DelayApperanceModifier: ViewModifier {

    
    @State var shouldDisplay = false
    let delay : Double
    func body(content: Content) -> some View {
        delayedView(content)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.shouldDisplay = true
                }
            }
        
    }
    
    @ViewBuilder
    func delayedView(_ content: Content) -> some View {
        if shouldDisplay {
            content
        } else {
            content.hidden()
        }
    }
    
}

extension View {
    func delayAppeareance(bySeconds seconds: Double) -> some View {
        modifier(DelayApperanceModifier(delay: seconds))
    }
}
