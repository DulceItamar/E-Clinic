/// `SearchingDoctorView` is a SwiftUI view that allows users to search for medical specialties. It displays a list of specialties and provides a search functionality to filter the list based on user input. Users can select a specialty from the list, which could lead to further actions, such as viewing doctors within that specialty.
/// - Parameters:
///    - dismiss: An environment variable that allows the view to dismiss itself when called, typically used for closing modal views.
///    - medicalSpecialties: A static array of strings representing various medical specialties derived from the MedicalSpeality enumeration. This array serves as the primary data source for the view's list of specialties.
///    - searchDoctor: A state variable that holds the current input from the user while searching for specialties. It updates the view in real-time as the user types.
///    - filteredName: A computed property that returns a filtered list of medical specialties based on the user’s input in searchDoctor. If the input is empty, it returns all specialties; otherwise, it returns a sorted list of specialties that contain the search term.



import SwiftUI

struct SearchingDoctorView: View {
    @Environment(\.dismiss) private var dismiss
    let medicalSpecialties: [String] = [
        MedicalSpeality.cardiology.rawValue,
        MedicalSpeality.dermatology.rawValue,
        MedicalSpeality.endocrinology.rawValue,
        MedicalSpeality.gastroenterology.rawValue,
        MedicalSpeality.geriatrics.rawValue,
        MedicalSpeality.gynecology.rawValue,
        MedicalSpeality.hematology.rawValue,
        MedicalSpeality.immunology.rawValue,
        MedicalSpeality.nephrology.rawValue,
        MedicalSpeality.neurology.rawValue,
        MedicalSpeality.oncology.rawValue,
        MedicalSpeality.orthopedics.rawValue,
        MedicalSpeality.pediatrics.rawValue,
        MedicalSpeality.psychiatry.rawValue,
        MedicalSpeality.pulmonology.rawValue,
        MedicalSpeality.radiology.rawValue,
        MedicalSpeality.rheumatology.rawValue,
        MedicalSpeality.urology.rawValue
    ]
    
    @State var searchDoctor: String = ""
    
    var filteredName: [String] {
        if searchDoctor.isEmpty {
            medicalSpecialties
        } else {
            medicalSpecialties.sorted().filter { $0.lowercased().contains(searchDoctor.lowercased())}
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            // A list that displays medical specialties. Each specialty is presented as a NavigationLink, allowing users to navigate to a detail view (currently represented by a simple Text view). The list is divided into a section with a header labeled "Sugerencias" (Suggestions).
            List {
                
                Section {
                    ForEach(medicalSpecialties, id: \.self) { speciality in
                        
                        NavigationLink{
                            Text(speciality)
                        } label: {
                            Text(speciality)
                        }
                    }
                } header: {
                    Text("Sugerencias")
                }
            }
            //A modifier that adds a search bar to the list, allowing users to filter the specialties based on their input. The prompt text instructs the user on what to enter in the search field.
            .searchable(text: $searchDoctor, prompt: Text("Especialidad"))
            .searchable(text:$searchDoctor){
                ForEach(filteredName, id: \.self){ suggestion in
                    
                    
                    NavigationLink{
                        Text(suggestion)
                    } label: {
                        Text(suggestion)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
        Spacer()
    }
}

#Preview {
    SearchingDoctorView()
}
