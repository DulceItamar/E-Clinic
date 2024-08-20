//
//  TabRouter.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 07/08/24.
//

import Foundation
import SwiftUI

class TabRouter:  ObservableObject {

    @Published  var homeStack = NavigationPath()
    @Published  var profileStack = NavigationPath()
    @Published  var settingStack = NavigationPath()
    
    
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
