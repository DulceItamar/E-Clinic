///`PatientManager`  is an ObservableObject that manages the state and validations related to a patient. It holds patient information, including user details, allergies, and birthdate. The class utilizes Combine to set up reactive validations for the patient's phone number and allergy status. It also allows for saving user data related to the patient.
/// - Parameters:
///    - patient: The Patient object that contains the patient's user details, birthdate, allergies, and gender.
///    - existAllergies: An enumeration value representing whether the patient has allergies. It defaults to .no.
///    - continueAccess: A boolean flag indicating whether the patient can proceed with the next steps based on validation checks. It defaults to false.
///    - cancellables: A set used to store Combine cancellables to manage subscriptions and memory.

import Foundation
import Combine

class PatientManager: ObservableObject {
    
    @Published var patient: Patient
    @Published var existAllergies : Allergies = .no
    @Published var continueAccess: Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    /// Initializes a new PatientManager instance with a default Patient object. The default values are set for the patient's user information, birthdate, allergies, and gender.
    init(
        patient: Patient = Patient(
            user: User(
                name: "",
                email: "",
                password: "",
                phone: "",
                typeOfUser: .patient
            ),
           
            birthdate: Date(),
            allergies: "",
            gender: .FEMALE
        )
    ) {
        self.patient = patient
        setupValidation()
    }
    
    
    
    /// `setupValidation`: Sets up validation checks using Combine to ensure that the patient's phone number is not empty and the allergy status is either yes or no. This method combines the latest values of the phone, allergies, and the existence of allergies to determine if the patient can proceed.
    final func setupValidation(){
        
        Publishers.CombineLatest3(
            $patient.map(\.user.phone),
            
            $patient.map(\.allergies),
            $existAllergies
            
            
        ).map({ phone, allergies, existAllergies in
            
            let phoneIsValid = !phone.isEmpty
            let allergiesIsValid = existAllergies == .yes  || (existAllergies == .no)
            return phoneIsValid && allergiesIsValid
            //  return !phone.isEmpty || !allergies.isEmpty
        })
        .assign(to: &$continueAccess)
        
    }
    
    
    ///`saveUserDataInPatient` Updates the patient object with new user data.
    /// - Parameters:
    ///    - userData: A User object containing the updated user information for the patient.
    final func saveUserDataInPatient(userData: User){
        patient.user = userData
        
    }
    
}
