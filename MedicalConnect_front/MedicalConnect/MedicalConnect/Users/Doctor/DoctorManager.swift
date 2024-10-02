///`DoctorManager` class is an ObservableObject that manages the state of a doctor's profile. It is designed to handle user input, validate the doctor's information, and provide functionality for saving and updating the doctor's data. The class utilizes the Combine framework for reactive programming, allowing it to respond to changes in state and propagate updates to views that observe it.
/// - Parameters:
///    - doctor: It holds the current state of the Doctor object, which includes personal and professional information about the doctor.
///    - continueAccess: This boolean property indicates whether the user can continue with the next step in the application. It is derived from validations of the doctor's information.
///    - addingServiceLabels: This property stores the input text for adding new services to the doctor's profile.
///    - cancellables: A set of AnyCancellable objects used to manage subscriptions to Combine publishers. This ensures that resources are properly released when no longer needed.


import Foundation
import Combine

class DoctorManager: ObservableObject {
    
    @Published var doctor: Doctor
    
    @Published var continueAccess: Bool = false
    
    @Published var addingServiceLabels: String = ""
    

    
    private var cancellables = Set<AnyCancellable>()
    init(
        doctor: Doctor = Doctor(
                        user:User(
                            name: "",
                            email: "",
                            password: "",
                            phone: "",
                            typeOfUser: .doctor
                        ),
                        medicalSpeciality: .gynecology,
                        professionalLicense: "",
                        jobDescription: "",
                        workDays: [.monday, .wednesday, .saturday],
                        services: [""],
                        servicePrice: 0.00, evaluationData: DoctorEvaluationData(
                            averageOfEvaluations: 0.0,
                            numberOfConsults: 0,
                            reviews: [Review(
                                name: "E-Connect",
                                evaluation: 0,
                                reviewDescription: "Aún no tiene evaluaciones"
                            )]
                        ))
    ) {
        self.doctor = doctor
        setupValidation()
    }
    
    
    
    /// `setupValidation` sets up validation logic for the doctor's information. It combines the doctor's phone number, professional license, and services into a single validation check to determine if all fields are filled. If all conditions are met, it sets the continueAccess property to true
    final func setupValidation(){
        Publishers.CombineLatest3(
            $doctor.map(\.user.phone),
            $doctor.map(\.professionalLicense),
            $doctor.map(\.services)

        ).map({ phone, professionalLicense, services in
            
            return !phone.isEmpty && !professionalLicense.isEmpty && !services.isEmpty
        })
        .assign(to: &$continueAccess)
        
    }
    
    
    /// `saveUserDataInDoctor` updates the doctor's user information with the provided User object.``
    final func saveUserDataInDoctor(userData: User){
        doctor.user = userData
    }
    
    
    ///`saveToServiceArray` appends a new service to the doctor's services array. This is used when adding services to the doctor's profile.
    final func saveToServiceArray(service: String){
        doctor.services.append(service)
        //doctorServices.append(service)
    }
}
