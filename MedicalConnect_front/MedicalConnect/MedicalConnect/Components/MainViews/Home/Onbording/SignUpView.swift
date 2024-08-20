//
//  SignUpView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var userManager = UserManager()
    @State var showPatientForm: Bool = false
    @State var showDoctorForm: Bool = false
    @EnvironmentObject var onboardingRouter : OnboardingRouter
    var body: some View {
        
        GeometryReader { geometry in 
            
            VStack{

                UpperFrame(label: "Registrarme como")
                
                    Picker("Type of user", selection: $userManager.selectedTypeOfUser) {
                    ForEach(TypeOfUsers.allCases, id: \.self) {option in
                        Text(option.rawValue)
                            .font(Font.custom("Montserrat-Regular", size: 12))
                    }
                }
                .pickerStyle(.segmented)
                .padding(EdgeInsets(top: geometry.size.height * 0.03, leading: 16, bottom:  geometry.size.height * 0.03, trailing: 16))
                    
                    
                    UserSignupFormView(
                        email: $userManager.user.email,
                        password: $userManager.user.password,
                        verifiedPassword: $userManager.verifiedPassword,
                        name: $userManager.user.name
                    )
                    .padding(EdgeInsets(top: geometry.size.height * 0.05, leading: 16, bottom:  geometry.size.height * 0.05, trailing: 16))
                    
                    Button(action: {
                        
                        if userManager.selectedTypeOfUser == .patient {
                            print("Patient")
                            onboardingRouter.navigate(for: .signup(.signPatient(user: userManager.user)))
                            //onboardingRouter.
                        } else if userManager.selectedTypeOfUser == .doctor {
                            print("Doctor")
                            onboardingRouter.navigate(for: .signup(.signupDoctor(user: userManager.user)))
                        }
                        
                        print("Continuar")
                        print("\(userManager.user.name)")
                    }, label: {
                        Text("Continuar")
                            .padding(.horizontal, 24)
                            .font(Font.custom("Montserrat-SemiBold", size: 16))
                            .kerning(1.2)
                    })
                
                    .buttonStyle(MainButtonStyle(isEnabled:  userManager.signupAccess))

                Spacer()

            }
            //.navigationDestination(for: ExternalRoutes.self) { $0 }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
        
    }
}

#Preview {
    SignUpView()
        .environmentObject(OnboardingRouter())
       
}
