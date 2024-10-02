///`HashTagView` is a SwiftUI component designed to allow users to add, display, and manage a list of tags or labels. It provides a user interface where users can input text, add it as a tag, and view all added tags in a dynamic, wrap-around layout.
///
///- Parameters:
///   - addingLabels: A binding to a string that captures the current input from the user for a new tag.
///   - tags: A binding to an array of strings representing the current list of tags.
///   - totalHeight: Tracks the total height of the HashTagView based on the content.



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
            
            
            //Provides an alternative way for users to add a tag by tapping the "Agregar" (Add) button.
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
            
            
            //Dynamically displays all the added tags in a wrap-around (flow) layout.
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    
    ///`generateContent` arranges the tags in a flexible layout that wraps tags to the next line when they exceed the available width.
    ///- Parameters:
    /// - g: GeometryProxy: Provides the size and coordinate space information.
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
    
    
    ///`item` creates a styled view for an individual tag.
    /// - Parameters:
    ///    - text: String: The text to display as a tag.
    private func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(.main)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
    
    
    ///`viewHeightReader` reads the height of the content and updates the totalHeight state variable.
    /// - Parameters:
    ///    - binding: Binding<CGFloat>: A binding to totalHeight to update it with the calculated height.
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
    @Previewable @State var addingLabels: String = ""
    @Previewable  @State var labels: [String] = ["Embarazo de riesgo", "Citología"]
    @Previewable  @State  var totalHeight = CGFloat.zero
    return HashTagView(addingLabels: $addingLabels, tags: $labels)
}
