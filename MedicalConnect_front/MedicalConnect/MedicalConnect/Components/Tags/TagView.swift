//
//  TagView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/08/24.
//

import SwiftUI



struct TagView: View {
    
    @State var rows: [[Tag]] = []
    @State var tags: [Tag] = []
    @Binding var services: [String]
    @Binding var tagText: String
    
   // @StateObject var tagViewModel = TagViewModel()
    var body: some View {
        VStack {
            Text("Ingrese los servicios que ofrece")
                .font(.custom("Montserrat-semiBold", size: 16))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal, 16)
          
            
            TextField("Ejemplo: Citologías", text: $tagText) {
                addTag()
            }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder()
                        .foregroundColor(.babyBlue300)
                    
                )
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            VStack(alignment: .leading, spacing: 4) {
                ForEach(rows, id: \.self) { rows in
                    HStack(spacing: 6){
                        ForEach(rows) { row in
                            Text(row.name)
                                .font(Font.custom("Montserrat-Regular", size: 16))
                                .padding(EdgeInsets(top: 8, leading: 22, bottom: 8, trailing: 14))
                                .background(
                                    ZStack(alignment: .leading, content: {
                                        Capsule()
                                            .fill(.babyBlue200)
                                        
                                        Button { 
                                            removeTag(by: row.id)
                                            removeService(by: row.name)
                                        } label: {
                                            Image(systemName: "xmark.circle").frame(width: 10, height: 10)
                                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 4, trailing: 0))
                                                .foregroundColor(.red)
                                        }
                                    })
                                
                                )
                            
                        }
                    }
                    .frame(height: 28)
                    .padding(.bottom, 10)
                    
                }
            }
            .padding(10)
        }
    }
    
    
    func getTags(){
        
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        let screenWidth = UIScreen.screenWidth - 10
        let tagSpacing: CGFloat = 16 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
        
        
        if !tags.isEmpty {
            for index in 0..<tags.count {
                self.tags[index].size = tags[index].name.getSize()
            }
            
            tags.forEach { tag in
                totalWidth += (tag.size + tagSpacing)
                
                if totalWidth > screenWidth {
                    totalWidth = (tag.size + tagSpacing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                } else {
                    currentRow.append(tag)
                }
               
               
            }
            
            if !currentRow.isEmpty {
                rows.append(currentRow)
                currentRow.removeAll()
            }
            self.rows = rows
        } else {
            self.rows = []
        }
    }
    
    func addTag() {
        
        let trimmedTagText = tagText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTagText.isEmpty else { return }
        let isDuplicate = tags.contains { $0.name.caseInsensitiveCompare(trimmedTagText) == .orderedSame }
        
        if !isDuplicate {
            tags.append(Tag(name: tagText))
            services.append(tagText)
         
            getTags()
           
        }
        DispatchQueue.main.async {
              self.tagText = ""
          }
        
    }
    
    func removeTag(by id: String){
        tags = tags.filter{$0.id != id }
       print("El id que se eliminó es: \(id)")
        getTags()
    }
    
    func removeService(by name: String){
        
        services.removeAll(where: { $0.caseInsensitiveCompare(name) == .orderedSame })
        
        print("Se eliminó el nombre de \(name)")
        
        print("\(services)")
        
        
    }
    
 

}

#Preview {
    
    @State var tagText: String = ""
    @State var Allservices: [String] = []
    
    return TagView(services: $Allservices, tagText: $tagText)
}


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.width
    
}

extension String {
    
        func getSize() -> CGFloat{
         
            let font2 = UIFont(name: "Montserrat-Regular", size: 14)
            let attributes = [NSAttributedString.Key.font: font2]
            let size = (self as NSString).size(withAttributes: attributes as [NSAttributedString.Key : Any])
            return size.width
        }
    
}
