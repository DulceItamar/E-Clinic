///`DoctorServicesCardView` is a SwiftUI view that displays a list of services offered by a doctor.
///
/// Each service is displayed in a `Text` view that is styled as a card with padding,
/// background color, and rounded corners.
///
/// - Parameter services: An array of strings representing the services offered by the doctor.

import SwiftUI

struct DoctorServicesCardView: View {
    let services: [String]
    var body: some View {
        
        
    /// The body of the view, which displays the list of services in a vertical stack.
    /// Each service is displayed in a `Text` view with padding, a white background, and rounded corners.
    /// The services are arranged vertically within a `VStack`, and the `ForEach` loop generates the views dynamically.
        VStack(alignment: .leading){
            ForEach(services, id: \.self) { service in
                Text(service)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        } 
    }
}

#Preview {
     DoctorServicesCardView(services: ["Cardiología pediátrica", "Nefrología pediátrica"])
}
