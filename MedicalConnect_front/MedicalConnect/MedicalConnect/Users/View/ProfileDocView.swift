///`ProfileDocView` is a SwiftUI view designed to present detailed information about a doctor. This view includes the doctor's name, evaluation score, medical specialty, services offered, workdays, job description, and reviews from patients. It also features a button for scheduling an appointment with the doctor.
///- Parameters:
/// - doctor: An instance of the Doctor model that contains the detailed information of the doctor being displayed, including their name, medical specialty, services, workdays, and job description.
/// - validations: An instance of the DoctorDataValidations class or struct that provides methods for validating or computing data related to the doctor's evaluations, consultations, and reviews.
/// - router: An environment object used for managing navigation routes within the application. It enables the view to perform routing actions when scheduling consultations.
/// - test: An instance used for generating or accessing sample data, useful in previews or for testing purposes.


import SwiftUI


struct ProfileDocView: View {
    let doctor: Doctor
    private let validations: DoctorDataValidations = DoctorDataValidations()

//    @EnvironmentObject var router: TabRouter
    @EnvironmentObject var onboardingRouter: OnboardingRouter

    let test = TestData()
    
    var body: some View {
        GeometryReader { geometry in
       
            
            
                VStack(spacing: geometry.size.height * 0.02 ) {
         
                    ZStack {
                        
                     
                        UpperFrame(label: "")
                            .offset(y: geometry.size.height * -0.45)
                            
                        ScrollView {
                            
             
                            
                            
                            //This view displays a card containing the doctor's name, evaluation score, specialty, services, workdays, number of consultations, and job description. It is padded for visual spacing.
                            CardAboutDoctorView(
                                name: doctor.user.name,
                                evaluation: validations.getAverageOfEvaluations(doctor: doctor),
                                medicalSpeciality: doctor.medicalSpeciality.rawValue,
                                servicios: doctor.services,
                                workDays: doctor.workDays,
                                numberOfConsults: validations.getNumberOfConsults(doctor: doctor),
                                jobDescription: doctor.jobDescription
                            )
                            .padding(.vertical, geometry.size.height * 0.02)
                            
                            
                            //This button triggers the action to schedule an appointment with the doctor. It utilizes the router to navigate to the scheduling screen. The button style is customizable, and padding is applied for better layout.
                            Button(action: {
                                
                                onboardingRouter.navigate(for: .home(.schedule(doctor: doctor)))
                                
                                //router.addHomeRoute(to: .schedule(doctor: doctor))
                                
                                
                                print("Agendar consulta")
                                
                            }, label: {
                                Text("Agendar consulta")
                                    .padding(.horizontal, 24)
                                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                                    .kerning(1.2)
                            })
                            .buttonStyle(MainButtonStyle(isEnabled: true))
                            .padding(.vertical, geometry.size.height * 0.02)
                            
                            
                            VStack {
                                Text("Reseñas")
                                    .padding(5)
                                    .font(Font.custom("Montserrat-semiBold", size: 16))
                                    .frame(maxWidth: .infinity)
                                    .background(.backgroundRows200, in: RoundedRectangle(cornerRadius: 8))
                                    .padding(.horizontal, 12)
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(validations.getReviews(doctor: doctor), id: \.id) { review in
                                            DoctorReviewCardView(
                                                name: review.name,
                                                evaluation: review.evaluation,
                                                review: validations.getReviewDescription(review: review.reviewDescription)
                                            )
                                        }
                                    }
                                }
                                .padding(.horizontal, 12)
                            }
                        }
                    }
                
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .toolbarBackground(.main, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                
            
            
            
      
        }
        .environmentObject(onboardingRouter)
    }
}



#Preview {
   
    let test = TestData()
    return ProfileDocView(doctor: test.doctor1)
//        .environmentObject(TabRouter())
        .environmentObject(OnboardingRouter())
     
}

