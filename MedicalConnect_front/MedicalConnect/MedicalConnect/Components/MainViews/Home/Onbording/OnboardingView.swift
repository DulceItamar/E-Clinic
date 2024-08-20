//
//  OnboardingView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject private var onboardingRouter : OnboardingRouter
    @ObservedObject private var validations = OnbordingValidations()
    
    @State var email: String = ""
    @State var password: String = ""


//    var body: some View {
//        
//        NavigationStack(path: $routeManager.routes) {
//            
//            ZStack {
//                ScrollView {
//                    
//                    VStack{
//                        
//                        Spacer()
//                        
//                        Image("LOGO")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 200, height: 200)
//                            .padding(.top, 20)
//                        
//                        Group {
//                            TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $email)
//                                .padding(.bottom, 32)
//                            
//                            
//                            TextFieldSecurityView(password: $password, label: "Contraseña", prompt: "Tu contraseña aquí...", keyboard: .asciiCapable)
//                                .padding(.bottom, 32)
//                            
//                            
//                        }
//                        
//                        Group {
//                            Button(action: {
//                                loginAccess = true
//                                routeManager.routes.append(.login(.home(.list)))
//                                //routeManager.routes.append(.login)
//                                print("Ingresando ...")
//                                
//                            }, label: {
//                                Text("Ingresar")
//                                    .padding(.horizontal, 24)
//                                    .font(Font.custom("Montserrat-SemiBold", size: 16))
//                                    .kerning(1.2)
//                            })
//                            .buttonStyle(MainButtonStyle(isEnabled: validations.disableButton))
//                            .padding(.bottom, 12)
//                            
//                            
//                            
//                            Button {
//                                routeManager.routes.append(.signup)
//                                print("Registrarse")
//                            } label: {
//                                
//                                VStack{
//                                    Text("¿No estás registrado?")
//                                        .font(Font.custom("Montserrat-Regular", size: 12))
//                                    Text("Crea tu cuenta aquí")
//                                        .font(Font.custom("Montserrat-SemiBold", size: 14))
//                                }
//                            }
//                            .tint(.black)
//                            .padding(.bottom, 8)
//                            
//    //                        Text("ó")
//    //                            .font(Font.custom("Montserrat-Regular", size: 12))
//    //                            .padding(.bottom, 8)
//                            
//                            
//                            //                        Button {
//                            //                            print("Registrarse con Apple")
//                            //                        } label: {
//                            //                            Label("Iniciar sesión con Apple", systemImage: "apple.logo")
//                            //                                .font(Font.custom("Montserrat-SemiBold", size: 16))
//                            //                        }
//                            //                        .buttonStyle(SignInWithAppleButtonStyle(isEnabled: true))
//                            
//                        }
//                        .navigationDestination(for: Route.self) { $0 }
//                    }
//                    
//                    
// 
//                    
//                    
//                    
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(content: {
//                    LinearGradient(gradient: Gradient(colors:[Color("babyBlue-100"), Color("babyBlue-200")]), startPoint: .top, endPoint: .bottom)
//                })
//                
//                
//                .ignoresSafeArea()
//                
//            }
//            .environmentObject(routeManager)
//
//        }
//        
//    }
//}

    
    
    var body: some View {
        NavigationStack(path: $onboardingRouter.routes) {
            ZStack {
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            Spacer()
                            
                            Image("LOGO")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding(.vertical, (geometry.size.height * 0.03))
                            
                            Group {
                                TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $email)
                                    .padding(.bottom, geometry.size.height * 0.04)
                                
                                TextFieldSecurityView(password: $password, label: "Contraseña", prompt: "Tu contraseña aquí...", keyboard: .asciiCapable)
                                    .padding(.bottom, geometry.size.height * 0.04)
                            }
                            .padding(.horizontal, 20)
                            
                            Group {
                                Button(action: {
                            
                                   
                                    print("Ingresando ...")
                                }, label: {
                                    Text("Ingresar")
                                        .padding(.horizontal, 24)
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                        .kerning(1.2)
                                })
                                .buttonStyle(MainButtonStyle(isEnabled: validations.disableButton))
                                .padding(.bottom, 12)
                                
                                Button {
                                    
                                 
                                    onboardingRouter.navigate(for: .signup(.generalForm))
                                    print("Registrarse")
                                } label: {
                                    VStack {
                                        Text("¿No estás registrado?")
                                            .font(Font.custom("Montserrat-Regular", size: 12))
                                        Text("Crea tu cuenta aquí")
                                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                                    }
                                }
                                .tint(.black)
                                .padding(.bottom, 8)
                                
                                Text("ó")
                                    .font(Font.custom("Montserrat-Regular", size: 12))
                                    .padding(.bottom, 8)
                                
                                Button {
                                    print("Registrarse con Apple")
                                } label: {
                                    Label("Iniciar sesión con Apple", systemImage: "apple.logo")
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                }
                                .buttonStyle(SignInWithAppleButtonStyle(isEnabled: true))
                            }
                            .navigationDestination(for: ExternalRoutes.self) { $0 }
                            
                            Spacer()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(content: {
                    LinearGradient(gradient: Gradient(colors:[Color("babyBlue-100"), Color("babyBlue-200")]), startPoint: .top, endPoint: .bottom)
                })
                .ignoresSafeArea()
            }
            .environmentObject(onboardingRouter)
            .navigationDestination(for: ExternalRoutes.self) { $0 }
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardingRouter())
}
