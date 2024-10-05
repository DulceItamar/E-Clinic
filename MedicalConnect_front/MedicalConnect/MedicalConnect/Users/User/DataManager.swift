///`UserManager` handles user-related information. including user registration and validation processes. It also manages the current `User`, `Patient`, and `Doctor` objects and provides functionality to validate signup access.

import Foundation
import Combine


//class DataManager: ObservableObject {
//    @Published var doctors : [Doctor] = []
//    @Published var patients : [Patient] = []
//    
//}

///`User`: it's an object that represents the logged-in or registering user.
///`Patient`: it's an object associated with the current user.
///`Doctor`: it's an object associated with the current user.
///`signupAccess`: it's a Boolean value that indicates whether the user has access to the signup process. It becomes `true` when the user's email, name, password, and verified password are all valid and match.
///`verifiedPassword`: it's a string that holds the verified password input during the signup process.
///`selectedTypeOfUser` : The selected type of user, either `Patient` or `Doctor`. This value updates the `typeOfUser` property of the `user` when it changes.
class UserManager: ObservableObject {
    @Published var user: User
    
    @Published var patient: Patient
    @Published var doctor: Doctor
    
 
    @Published var signupAccess : Bool = false
    @Published var verifiedPassword : String = ""
    @Published var selectedTypeOfUser: TypeOfUsers = .patient {
        didSet {
            user.typeOfUser = selectedTypeOfUser
        }
    }

    /// A set of cancellables to manage the lifecycle of Combine publishers.
    private var cancellables = Set<AnyCancellable>()
    
    
    // Initializes the `UserManager` with default or provided `User` data and sets up default `Patient` and `Doctor` objects.
    /// - Parameter user: A `User` object, defaulted to an empty user with a patient type.
    init(
        user: User = User(
            name: "",
            email: "",
            password: "",
            phone: "",
            typeOfUser: .patient,
            typeOfSignup: nil
        )
    ) {
       
        
        
        self.user = user
        self.patient = Patient(user: user, birthdate: Date(), allergies: "", gender: .FEMALE)
        self.doctor = Doctor(
            user: user,
            medicalSpeciality: .cardiology,
            professionalLicense: "",
            jobDescription: "",
            workDays: [.monday, .wednesday, .friday],
            services: [""],
            servicePrice: 0.00, evaluationData: DoctorEvaluationData(
                averageOfEvaluations: 0.0,
                numberOfConsults: 0,
                reviews: [Review(
                    name: "E-Connect",
                    evaluation: 0,
                    reviewDescription: "Aún no tiene evaluaciones"
                )]
            )
        )
        
        
        checkGoogleUser()
        setupValidation()
        
    }
    
    
    ///`setupValidation`: it sets up validation logic to control the `signupAccess` property.
    /// This method uses Combine to observe the user's email, name, and password fields, as well as the verified password, and enables signup access when all fields are valid.
    private func setupValidation(){
        
       
        Publishers.CombineLatest4(
            $user.map(\.email),
            $user.map(\.name),
            $user.map(\.password),
            $verifiedPassword
        ).map({ email, name, password, verifiedPassword in
            
            return !email.isEmpty && !name.isEmpty && !password.isEmpty && password == verifiedPassword
        })
        .assign(to: &$signupAccess)
        
    }
    
    
    ///`checkGoogleUser`: It checks if there is a Google user currently signed in and updates the `user`'s name and email if available.
    /// This method pulls the data from a shared instance of `GoogleHandlerViewModel`.
    private func checkGoogleUser() {
        if let googleUser = GoogleHandlerViewModel.shared.googleUser {
            self.user.name = googleUser.name ?? "Nombre no encontrado"
            self.user.email = googleUser.email ?? "Email no encontrado"
        }
    }
}



    






