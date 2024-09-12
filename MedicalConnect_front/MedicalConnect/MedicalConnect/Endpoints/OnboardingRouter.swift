//
//  NavigationRouter.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 31/07/24.
//

import Foundation
import SwiftUI

final class OnboardingRouter: ObservableObject {
    @Published var routes = NavigationPath()
    
    func navigate(for route: ExternalRoutes){
        routes.append(route)
    }
    
    
    func popToLast(){
        routes.removeLast()
    }
    
    func popToRoot(){
        routes.removeLast(routes.count)
    }
    
    
}
