//
//  MainTabView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/24.
//

import SwiftUI

struct MainTabView: View {
    
    
    @State var selectedTabView: TabMenu = .home
    @EnvironmentObject private var router: TabRouter
    
    var body: some View {
        
        TabView(selection: tabSelection()) {
            MyProfileView()
                .tabItem {  
                    Image("heart.profile-3")
                        .renderingMode(.template)
                    Text("Mi perfil") }
                .tag(TabMenu.profile)
            
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(TabMenu.home)
            
            ConfigView()
                .tabItem { Label("Configuración", systemImage: "gearshape.2.fill") }
                .tag(TabMenu.settings)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(named: "mainColor")
            
            UITabBar.appearance().barTintColor = UIColor.gray
        }
        .navigationBarBackButtonHidden()
        .tint(.white)
        .onChange(of: selectedTabView) { oldValue, newValue in
            print("From \(oldValue) to \(newValue) ")
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(TabRouter())
}

extension MainTabView {
    private func tabSelection() -> Binding<TabMenu>{
        Binding {
            self.selectedTabView
        } set: { tappedTab in
            switch tappedTab {
                case .home:
                    if !router.homeStack.isEmpty {
                        router.popToRootHomeRoute()
                    }
                   
                case .profile:
                    if !router.profileStack.isEmpty {
                        router.popToRootProfileRoute()
                    }
                   
                case .settings:
                    if !router.settingStack.isEmpty {
                        router.popToRootSettingRoute()
                    }
                    
                   
            }
            
         
            self.selectedTabView = tappedTab
        }

    }
    
    
    
}


//extension MainTabView {
//    private func tabSelection() -> Binding<TabMenu> {
//        Binding {
//            self.selectedTabView
//        } set: { tappedTab in
//           
//            if tappedTab == self.selectedTabView {
//                
//            }
//            
//            self.selectedTabView = tappedTab
//        }
//      
//    }
//}
