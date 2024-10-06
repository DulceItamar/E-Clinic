

import Foundation
import SwiftUI


//MARK: - Menu Tab
///`TabMenu` is an enum representing the tab menu options in the app. These are used for navigating between internal main screens.



enum TabMenu: Hashable, Identifiable, CaseIterable {
    case home
    case settings
    case profile
    
    
    // Provides a unique identifier for each case of the enum, required to conform to `Identifiable`.
    var id: TabMenu { self }
    
}


/// `HomeRoute`is an enum representing navigation routes within the Home section of the app.
/// Each case corresponds to a different view that can be navigated to from the home screen.
enum HomeRoute: Hashable {
    case details(doctor: Doctor)
    case schedule(doctor: Doctor)
    case confirmPayment
}


/// Extending `HomeRoute` to conform to `View`, allowing direct rendering of the associated views based on the current route.
//extension HomeRoute: View {
//    var body: some View {
//        switch self {
//            case .details(let doctor):
//                ProfileDocView(doctor: doctor)
//            case .schedule(let doctor):
//                SchedulePayAppoinmentView(doctor: doctor)
//            case .confirmPayment:
//                BacgroundMessageView()
//        }
//    }
//}



///`SettingRoute` is an enum representing navigation routes within the Settings section of the app.
enum SettingRoute: Hashable {
    case details(item: Service)
    
}

/// Extending `SettingRoute` to conform to `View`, allowing direct rendering of the associated views.
//extension SettingRoute: View {
//    var body: some View {
//        switch self {
//            case .details(item: let service):
//                switch service.title {
//                    case .auth:
//                        AuthTwoWaysView()
//                    case .notifications:
//                        NotificationsView()
//                    case .payment:
//                        PaymentMethodsView()
//                    case .termsAndconditions:
//                        ConditionsAndTermView()
//                    case .privacy:
//                        PrivacyPoliciesView()
//                    case .contact:
//                        ContactView()
//                    
//                }
//        }
//    }
//}


///`ProfileRoute` is an enum representing navigation routes within the Profile section of the app.
enum ProfileRoute: Hashable {
    case details(item: MyMenu)
}


/// Extending `ProfileRoute` to conform to `View`, allowing direct rendering of the associated views.
//extension ProfileRoute : View {
//    var body: some View {
//        switch self {
//            case .details(let item):
//                switch item.title {
//                    case .myData:
//                        MyDataView()
//                    case .myAppointments:
//                        MyAppointmentsHistoryView()
//                    case .myStudies:
//                        myMedicalStudiesHistoryView()
//                    case .treatments:
//                        MyMedicalRecordsHistory()
//                }
//        }
//    }
//}


//MARK: - External Actions

//Enum for external routes
///`ExternalRoutes`is an enum representing external navigation routes (outside the main app flow).
//enum OnboardingRoutes: Hashable {
//    case signup(SignupRoute)
//    case login(TabMenu)
//  
//    
//    /// Enum representing the signup routes.
//    enum SignupRoute: Hashable {
//        case generalForm(typeOfSignup: TypeOfAuth)
//        case signupDoctor(user: User)
//        case signPatient(user: User)
//    }
//}



enum AppRoute: Hashable {
    case signup(SignupRoute)
    case login(TabMenu)
    case home(HomeRoute)
    case settings(SettingRoute)
    case profile(ProfileRoute)
  
}


/// Enum representing the signup routes.
enum SignupRoute: Hashable {
    case generalForm(typeOfSignup: TypeOfAuth)
    case signupDoctor(user: User)
    case signupPatient(user: User)
}


extension AppRoute : View {
    var body: some View {
        switch self {
            case .signup(let signupRoute):
                switch signupRoute {
                    case .generalForm(let typeOfSignup):
                        SignUpView(typeOfSignup: typeOfSignup)
                        
                    case .signupDoctor(user: let user):
                        DoctorSignupFormView(user: user)
                        
                    case .signupPatient(user: let user):
                        PatientSignupFormView(user: user)
                        
                }
                
            case .login(let tabMenu):
                switch tabMenu {
                    case .home:
                        MainTabView(selectedTabView: .home)
                            
                    case .settings:
                        MainTabView(selectedTabView: .settings)
                            
                    case .profile:
                        MainTabView(selectedTabView: .profile)
                           
                }
                
            case .home(let homeRoute):
                switch homeRoute {
                    case .details(let doctor):
                        ProfileDocView(doctor: doctor)
                    case .schedule(let doctor):
                        SchedulePayAppoinmentView(doctor: doctor)
                    case .confirmPayment:
                        BacgroundMessageView()
                        
                }
                
            case .settings(let settingRoute):
                switch settingRoute {
                    case .details(item: let service):
                        switch service.title {
                            case .auth:
                                AuthTwoWaysView()
                                  
                            case .notifications:
                                NotificationsView()
                                   
                            case .payment:
                                PaymentMethodsView()
                                  
                            case .termsAndconditions:
                                ConditionsAndTermView()
                                    
                            case .privacy:
                                PrivacyPoliciesView()
                                  
                            case .contact:
                                ContactView()
                                    
                            
                        }
                }
                
            case .profile(let profileRoute):
                switch profileRoute {
                    case .details(let item):
                        switch item.title {
                            case .myData:
                                MyDataView()
                                    
                            case .myAppointments:
                                MyAppointmentsHistoryView()
                            case .myStudies:
                                myMedicalStudiesHistoryView()
                            case .treatments:
                                MyMedicalRecordsHistory()
                        }
                }
        }
    }
}




/// Extending `ExternalRoutes` to conform to `View`, allowing direct rendering of the associated views.
//extension OnboardingRoutes: View {
//    var body: some View {
//        switch self {
//            case .login(let tab):
//                switch tab {
//                        
//                    case .home:
//                        MainTabView(selectedTabView: .home)
//                    case .settings:
//                        MainTabView(selectedTabView: .settings)
//                    case .profile:
//                        MainTabView(selectedTabView: .profile)
//                }
//                
//                
//            case .signup(let route):
//                switch route{
//                    case .generalForm(let typeOfSignup):
//                            SignUpView(typeOfSignup: typeOfSignup)
//                    case .signPatient(user: let user):
//                        PatientSignupFormView(user: user)
//                    case .signupDoctor(user: let user):
//                        DoctorSignupFormView(user: user)
//                }
//          
//                
//        }
//    }
//}

