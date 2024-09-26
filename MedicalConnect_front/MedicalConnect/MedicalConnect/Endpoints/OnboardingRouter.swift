/// `OnboardingRouter` is responsible for handling the navigation flow within the onboarding process of the application.
/// It uses a `NavigationPath` to track and manage the user's navigation history and allows for programmatic navigation between different routes.
/// The router provides methods to navigate forward, pop to the last screen, or return to the root of the navigation stack.


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
