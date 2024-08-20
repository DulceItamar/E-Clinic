//
//  TestAddingLabels.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 01/08/24.
//
import SwiftUI

struct HashTagView: View {

    
    @Binding var addingLabels: String
    
    @Binding var tags: [String]
        
 @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            Text("Escribe sobre tus servicios")
                .font(Font.custom("Montserrat-semiBold", size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal, 16)
            
            
            TextField("Ejemplo: Citologías", text: $addingLabels, onCommit: {
                   if !addingLabels.isEmpty {
                       tags.append(addingLabels)
                       addingLabels = ""
                       
                   }
               })
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .opacity(0.4)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("babyBlue-300"), lineWidth: 1.0)
                    )
            )
            
            
               Button("Agregar") {
                   if !addingLabels.isEmpty {
                       tags.append(addingLabels)
                       addingLabels = ""
                   }
               }
               .tint(.backgroundRows200)
               .buttonStyle(.borderedProminent)
               .buttonBorderShape(.capsule)
               .padding(.vertical,8)
            
            
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(.main)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}


#Preview {
    @State var addingLabels: String = ""
    @State var labels: [String] = ["Embarazo de riesgo", "Citología"]
    
    @State  var totalHeight = CGFloat.zero
    return HashTagView(addingLabels: $addingLabels, tags: $labels)
}
