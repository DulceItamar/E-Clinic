
///This OnboardingView is a SwiftUI view responsible for handling user onboarding, which includes logging in with an email and password, navigating to sign-up pages, and other authentication-related actions.



import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject private var onboardingRouter : OnboardingRouter
    @ObservedObject private var onboardingManager = LoginViewModel()
    
    
    @State private var showStartingView : Bool = true
    
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
                                TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $onboardingManager.email)
                                    .textInputAutocapitalization(.never)
                                    .padding(.bottom, geometry.size.height * (onboardingManager.email.isEmpty ? 0.04: 0.01))
                                    .onChange(of: onboardingManager.email) { _, _ in
                                        onboardingManager.emailFormatValidation()
                                    }
                                
                                if !onboardingManager.email.isEmpty{
                                    LabelValidations(typeOfField: .email, isValid: onboardingManager.isEmailTextValidation())
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .padding(.bottom, geometry.size.height * 0.02)
                                }
                                
                                
                                TextFieldSecurityView(password: $onboardingManager.password, label: "Contraseña", prompt: "Tu contraseña aquí...", keyboard: .asciiCapable)
                                    .padding(.bottom, geometry.size.height * (onboardingManager.password.isEmpty ? 0.04: 0.01))
                                
                                
                                if !onboardingManager.password.isEmpty {
                                    LabelValidations(typeOfField: .password, isValid: onboardingManager.isPasswordTextValidation())
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .padding(.bottom, geometry.size.height * 0.04)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            Group {
                                
//
                                if let errorMessage = onboardingManager.errorMessage {
                                    Text(errorMessage)
                                        .foregroundStyle(.red)
                                        .padding(.bottom, geometry.size.height * 0.04)
                                }
                                
                             
                                
                                Button(action: {
                                    
                                    onboardingManager.login()
                                    
                                    
                                    if Auth.shared.loggedIn {
                                        onboardingRouter.navigate(for: .login)
                                        
                                        print("Ingresando ...")
                                    }
                                    
                                }, label: {
                                    Text("Ingresar")
                                        .padding(.horizontal, 24)
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                        .kerning(1.2)
                                })
                                .buttonStyle(MainButtonStyle(isEnabled: onboardingManager.availableButton()))
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
                
                if onboardingManager.isLoading {
                    ProgressView()
                        .tint(.babyBlue300)
                        .scaleEffect(2)
                }
                
            }
            .fullScreenCover(isPresented: $showStartingView, content: {
                StartingView(showStartingView: $showStartingView)
            })
            .environmentObject(onboardingRouter)
            .navigationDestination(for: ExternalRoutes.self) { $0 }
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardingRouter())
}
