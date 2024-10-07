

import Foundation
import SwiftUI


// MARK: -  Tab Menu



///`TabMenu` is an enum representing the tab menu options in the app. These are used for navigating between internal main screens.
enum TabMenu: Hashable, Identifiable, CaseIterable {
    
    
    case home
    case settings
    case profile
    
    
    // Provides a unique identifier for each case of the enum, required to conform to `Identifiable`.
    var id: TabMenu { self }
    
}



/// `HomeRoute`is an enum representing navigation routes within the Home section of the app. Each case corresponds to a different view that can be navigated to from the home screen.
enum HomeRoute: Hashable {
    case details(doctor: Doctor)
    case schedule(doctor: Doctor)
    case confirmPayment
}



/// Extending `HomeRoute` to conform to `View`, allowing direct rendering of the associated views based on the current route.
extension HomeRoute: View {
    var body: some View {
        switch self {
            case .details(let doctor):
                ProfileDocView(doctor: doctor)
            case .schedule(let doctor):
                SchedulePayAppoinmentView(doctor: doctor)
            case .confirmPayment:
                BacgroundMessageView()
        }
    }
}



///`SettingRoute` is an enum representing navigation routes within the Settings section of the app.
enum SettingRoute: Hashable {
    case details(item: Service)
    
}



/// Extending `SettingRoute` to conform to `View`, allowing direct rendering of the associated views.
extension SettingRoute: View {
    var body: some View {
        switch self {
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
    }
}



///`ProfileRoute` is an enum representing navigation routes within the Profile section of the app.
enum ProfileRoute: Hashable {
    case details(item: MyMenu)
}


/// Extending `ProfileRoute` to conform to `View`, allowing direct rendering of the associated views.
extension ProfileRoute : View {
    var body: some View {
        switch self {
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



//MARK: - External Actions

//Enum for external routes
///`AppRoute`is an enum representing login and signup navigation routes
enum AppRoute: Hashable {
    case signup(SignupRoute)
    case login(TabMenu)
  
}



/// `SignupRoute`is an Enum representing the signup routes.
enum SignupRoute: Hashable {
    case generalForm(typeOfSignup: TypeOfAuth)
    case signupDoctor(user: User)
    case signupPatient(user: User)
}



/// Extending `AppRoute` to conform to `View`, allowing direct rendering of the associated views.
extension AppRoute : View {
    var body: some View {
        switch self {
            case .signup(let signup):
                switch signup {
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
        }
    }
}
