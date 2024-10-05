

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
///`ExternalRoutes`is an enum representing external navigation routes (outside the main app flow).
enum ExternalRoutes: Hashable {
    case signup(SignupRoute)
    case login
    case logout
    
    /// Enum representing the signup routes.
    enum SignupRoute: Hashable {
        case generalForm(typeOfSignup: TypeOfAuth)
        case signupDoctor(user: User)
        case signPatient(user: User)
    }
}


/// Extending `ExternalRoutes` to conform to `View`, allowing direct rendering of the associated views.
extension ExternalRoutes: View {
    var body: some View {
        switch self {
            case .login:
                 //EmptyView()
                MainTabView(selectedTabView: .home)
            case .signup(let route):
                switch route{
                    case .generalForm(let typeOfSignup):
                            SignUpView(typeOfSignup: typeOfSignup)
                    case .signPatient(user: let user):
                        PatientSignupFormView(user: user)
                    case .signupDoctor(user: let user):
                        DoctorSignupFormView(user: user)
                }
            case .logout:
                OnboardingView()
                
        }
    }
}

