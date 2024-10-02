///`DoctorReviewCardView` is a SwiftUI view that displays a review of a doctor, including the reviewer's name, evaluation, and the content of the review.

/// - Parameters:
///   - name: The name of the person who left the review.
///   - evaluation: The reviewer's evaluation of the doctor, represented as a float (e.g., 4.5).
///   - review: The textual content of the review describing the experience with the doctor.
import SwiftUI

struct DoctorReviewCardView: View {
    
    let name: String
    let evaluation: Float
    let review: String
        
    var body: some View {
                    
                    
                    VStack(alignment: .leading, spacing: 8){
                        // Header: Displays the reviewer's name and the evaluation score side by side.
                        HStack{
                            Text(name)
                                .font(Font.custom("Montserrat-semiBold", size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Text("\(evaluation, format: .number.precision(.fractionLength(1)))")
                                .font(Font.custom("Montserrat-semiBold", size: 18))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                        
                        // Body: Displays the review content in regular font.
                        Text(review)
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                    .padding(12)
                    .background(.backgroundRows100)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .mint, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 350)

    }
}

#Preview {

     DoctorReviewCardView(name: "Giuliana Giraud", evaluation: 5.0, review: "El Dr. Martínez ha sido un verdadero salvavidas para mí. Después de años de lucha con problemas de tiroides, finalmente encontré a un especialista que no solo es extremadamente conocedor, sino también empático y paciente. Durante cada consulta, se toma el tiempo para explicar cada detalle de mi tratamiento y responder todas mis preguntas. ")
}
