//
//  Route.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 31/07/24.
//

import Foundation
import SwiftUI


//MARK: - Menu Tab

//Enum for internal routes
enum TabMenu: Hashable, Identifiable, CaseIterable {
    case home
    case settings
    case profile
    
    var id: TabMenu { self }
    
}


enum HomeRoute: Hashable {
    case details(doctor: Doctor)
    case schedule(doctor: Doctor)
    case confirmPayment
}

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


enum SettingRoute: Hashable {
    case details(item: Service)
    
}

extension SettingRoute: View {
    var body: some View {
        switch self {
            case .details(item: let service):
                ServiceDetailView(service: service)
        }
    }
}


enum ProfileRoute: Hashable {
    case details(item: MyMenu)
}

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
enum ExternalRoutes: Hashable {
    case signup(SignupRoute)
    case login
//    case logout
//    case settings
    
    
    enum SignupRoute: Hashable {
        case generalForm
        case signupDoctor(user: User)
        case signPatient(user: User)
    }
}


extension ExternalRoutes: View {
    var body: some View {
        switch self {
            case .login:
                 EmptyView()
            case .signup(let route):
                switch route{
                    case .generalForm:
                        SignUpView()
                    case .signPatient(user: let user):
                        PatientSignupFormView(user: user)
                    case .signupDoctor(user: let user):
                        DoctorSignupFormView(user: user)
                }
        }
    }
}




//enum Route {
//    
//    
//    case signup
//    case login
//    case signupForm(UserRoute)
//    
//    
//    enum UserRoute: Hashable {
//        case doctor(user: User)
//        case patient(user: User)
//    }
//
//}
//
//extension Route: Hashable {
//
//    
//    func hash(into hasher: inout Hasher) {
//       hasher.combine(self.hashValue)
//    }
//    
//    
//    static func == (lhs: Route, rhs: Route) -> Bool {
//        switch (lhs, rhs) {
//
//                
//            case (.signup,  .signup):
//                return true
//                
//            case (.signupForm(let lhsUser), .signupForm(let rhsUser)):
//                return lhsUser == rhsUser
//                
//            default:
//                return false
//  
//        }
//    }
//    
//
//}
//
//
//extension Route: View {
//    
//    var body: some View{
//        switch self {
//            case .login:
//                EmptyView()
//            case .signup:
//                    SignUpView()
//            case .signupForm(let userRoute):
//                switch userRoute{
//                    
//                        
//                    case .doctor(user: let user):
//                        DoctorSignupFormView(user: user)
//                    case .patient(user: let user):
//
//                        PatientSignupFormView(user: user)
//                }
//        }
//    }
//    
//}
//


