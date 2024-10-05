///`TabRouter` is a class that handles the routes of the Home, Profile and Setting views from the main TabView.
////// It maintains separate navigation stacks for each tab and provides methods to add, remove, and navigate between routes for each section.


import Foundation
import SwiftUI

class TabRouter:  ObservableObject {

    
    ///- homeStack: The navigation stack for the Home tab. Manages the route history for the Home section.
    ///- profileStack: The navigation stack for the Profile tab. Manages the route history for the Profile section.
    ///- settingStack: The navigation stack for the Settings tab. Manages the route history for the Settings section.
    @Published  var homeStack = NavigationPath()
    @Published  var profileStack = NavigationPath()
    @Published  var settingStack = NavigationPath()
    
    let log = OnboardingRouter()
    
    
    // MARK: - Home Route
    
    func addHomeRoute(to target: HomeRoute){
        homeStack.append(target)
    }
    
    func navigateBackHomeRoute(){
        homeStack.removeLast()
    }
    
    func popToRootHomeRoute(){
        homeStack.removeLast(homeStack.count)
    }
    
    // MARK: - Setting Route
    
    func addSettingRoute(to target: SettingRoute){
        settingStack.append(target)
    }
    
    func navigateBackSettingRoute(){
        settingStack.removeLast()
    }
    
    func popToRootSettingRoute(){
        settingStack.removeLast(settingStack.count)
    }
    
 
    
    
    //MARK: - Profile Route
    
    func addProfileRoute(to target: ProfileRoute){
        profileStack.append(target)
    }
    
    func navigateBackProfileRoute(){
        profileStack.removeLast()
    }
    
    func popToRootProfileRoute(){
        profileStack.removeLast(profileStack.count)
    }
}

/// An extension for `Binding` that triggers a closure when the binding value is updated.
/// A method that allows a closure to be executed whenever the binding's value changes.
/// - Parameter closure: The closure to be executed on value update.
/// - Returns: A new `Binding` instance that calls the closure on value changes.
extension Binding {
    func onUpdate(_ closure: @escaping() -> Void) -> Binding {
        Binding(get: {
                    wrappedValue
                }, set: { newValue in
                    wrappedValue = newValue
                    closure()
                })
    }
}
