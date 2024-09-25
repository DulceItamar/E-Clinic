///A SwiftUI view for the onbording and login process.
///
///This `OnboardingView` is a SwiftUI view responsible for handling user onboarding, which includes logging in with an email and password, navigating to sign-up pages, and other authentication-related actions.The view dynamically updates to provide feedback on the validaty of the inputs and allows navigation to the sign-up flow or alternative login methods such as Apple Sign-in. 
///
/// - Dependencies:
///   - t uses the `OnboardingRouter` environment object to handle navigation.
///   - It also uses the `LoginViewModel` observed object to manage the user's input, validation, login logic, and state (e.g., whether the user is logged in or if there are errors).
///
///- Parameters:
///   - onboardingRouter: An `EnvironmentObject` used to manage the navigation paths within the onboarding flow.
///   - onboardingManager: An `ObservedObject` used to manage the login data (email, password) and state such as error messages or validation status.
///   - showStartingView: A `State` variable that controls whether the full-screen `StartingView` is visible.



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
                                //Email input field with validation
                                TextFieldDataView(label: "Email", prompt: "ejemplo@email.com", keyboard: .emailAddress, data: $onboardingManager.email)
                                    .textInputAutocapitalization(.never)
                                    .padding(.bottom, geometry.size.height * (onboardingManager.email.isEmpty ? 0.04: 0.01))
                                    .onChange(of: onboardingManager.email) { _, _ in
                                        onboardingManager.emailFormatValidation()
                                    }
                                
                                //Show email validation label only if email is not empty
                                if !onboardingManager.email.isEmpty{
                                    LabelValidations(typeOfField: .email, isValid: onboardingManager.isEmailTextValidation())
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .padding(.bottom, geometry.size.height * 0.02)
                                }
                                
                                //Password input field with validation
                                TextFieldSecurityView(password: $onboardingManager.password, label: "Contraseña", prompt: "Tu contraseña aquí...", keyboard: .asciiCapable)
                                    .padding(.bottom, geometry.size.height * (onboardingManager.password.isEmpty ? 0.04: 0.01))
                                
                                //Show password validation label only if password is not empty
                                if !onboardingManager.password.isEmpty {
                                    LabelValidations(typeOfField: .password, isValid: onboardingManager.isPasswordTextValidation())
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .padding(.bottom, geometry.size.height * 0.04)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            
                            Group {
                            
                                //Diplay any Error message about login
                                if let errorMessage = onboardingManager.errorMessage {
                                    
                                    Text(errorMessage)
                                        .foregroundStyle(.red)
                                        .padding(.bottom, geometry.size.height * 0.04)
                                }
                                
                                Button(action: {
                                    
                                    onboardingManager.loginWithEmail()
                                    
                                    //Navigate if the user is logged in successfully
                                    onboardingManager.navigateToNextView(onboardingRouter: onboardingRouter, login: .EmailAuth )
                                    print("Ingresando")
                                    
                                }, label: {
                                    Text("Ingresar")
                                        .padding(.horizontal, 24)
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                        .kerning(1.2)
                                })
                                .buttonStyle(MainButtonStyle(isEnabled: onboardingManager.availableButton()))
                                .disabled(!onboardingManager.availableButton())
                                .padding(.bottom, 12)
                                
                                
                                ///`Sign-up Button`: Button to navigate to sign-up view
                                Button {
                                
                                    onboardingRouter.navigate(for: .signup(.generalForm(typeOfSignup: .EmailAuth)))
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
                                
                                /// `Sign-up Google Button:`Button for Google sign-in
                                Button {
                                    onboardingManager.loginWithGoogle { success in
                                        if success {
                                            onboardingManager.navigateToNextView(onboardingRouter: onboardingRouter, login: .GoogleAuth)
                                            print("Registrarse con Google")
                                        } else {
                                            print("Error durante el inicio de sesión con Google")
                                        }
                                    }
                                    
                                 
                                    
                                } label: {
                                    
                                    HStack {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Iniciar sesión con Google")
                                    }
                                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                                }
                                .buttonStyle(SignInWithGoogleButtonStyle(isEnabled: true))
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
                
                // Display loading  indicator if the login process is ongoing
                if onboardingManager.isLoading {
                    ProgressView()
                        .tint(.babyBlue300)
                        .scaleEffect(2)
                }
            }
            //Present the full-screen starting view
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
