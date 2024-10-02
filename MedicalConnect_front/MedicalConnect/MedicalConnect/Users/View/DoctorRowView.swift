///`DoctorRowView` is a SwiftUI view that presents a summary of a doctor's information in a horizontal layout. It includes the doctor's name, medical specialty, services offered, an average evaluation score, and a profile image. This view is typically used in lists or grids to display multiple doctors in a compact format.
/// - Parameters:
///    - doctor: An instance of the Doctor model that contains all relevant data for the doctor being displayed, including their name, specialty, services, and evaluation data.
///    - validations: An instance of the DoctorDataValidations class or struct that provides methods to validate or compute data related to doctors, such as average evaluations.

import SwiftUI

struct DoctorRowView: View {
    
    let doctor: Doctor
    let validations = DoctorDataValidations()
    
    
    var body: some View {
        
        
        HStack{
            VStack(alignment: .leading){
                Text(doctor.user.name)
                    .font(Font.custom("Montserrat-SemiBold", size: 16, relativeTo: .title))
                
                Group {
                    Text(doctor.medicalSpeciality.rawValue)
                        .font(Font.custom("Montserrat-Regular", size: 12, relativeTo: .subheadline))
                    
                    DoctorServicesCardView(services: doctor.services)
                        .font(Font.custom("Montserrat-Regular", size: 10, relativeTo: .subheadline))
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(.horizontal, 12)
            
            VStack(alignment: .center){
                
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                
                
                Label("\(validations.getAverageOfEvaluations(doctor: doctor), format: .number.precision(.fractionLength(1)))/5.0", systemImage: "star.fill")
                    .font(Font.custom("Montserrat-SemiBold", size: 14,relativeTo: .subheadline))
                    .environment(\.layoutDirection, .rightToLeft)
                
            }
            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 14))
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.babyBlue300), in: RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .padding(.horizontal, 12)
    }
}

#Preview {
    
    let test = TestData()
    return DoctorRowView(doctor: test.doctor1)
    
}


