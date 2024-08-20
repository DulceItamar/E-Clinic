//
//  TagViewModel.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/08/24.
//

import Foundation
import UIKit

//class TagViewModel : ObservableObject {
//    @Published var rows: [[Tag]] = []
//    @Published var tags: [Tag] = []
//    
//    
//    @Published var tagText = ""
//    
//    init() {
//        getTags()
//    }
//    
//    func getTags(){
//        
//        var rows: [[Tag]] = []
//        var currentRow: [Tag] = []
//        
//        var totalWidth: CGFloat = 0
//        let screenWidth = UIScreen.screenWidth - 10
//        let tagSpacing: CGFloat = 16 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
//        
//        
//        if !tags.isEmpty {
//            for index in 0..<tags.count {
//                self.tags[index].size = tags[index].name.getSize()
//            }
//            
//            tags.forEach { tag in
//                totalWidth += (tag.size + tagSpacing)
//                
//                if totalWidth > screenWidth {
//                    totalWidth = (tag.size + tagSpacing)
//                    rows.append(currentRow)
//                    currentRow.removeAll()
//                    currentRow.append(tag)
//                } else {
//                    currentRow.append(tag)
//                }
//               
//               
//            }
//            
//            if !currentRow.isEmpty {
//                rows.append(currentRow)
//                currentRow.removeAll()
//            }
//            self.rows = rows
//        } else {
//            self.rows = []
//        }
//    }
//    
//    func addTag() {
//        
//        let trimmedTagText = tagText.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !trimmedTagText.isEmpty else { return }
//        let isDuplicate = tags.contains { $0.name.caseInsensitiveCompare(trimmedTagText) == .orderedSame }
//        
//        if !isDuplicate {
//            tags.append(Tag(name: tagText))
//         
//            getTags()
//           
//        }
//        DispatchQueue.main.async {
//              self.tagText = ""
//          }
//        
//    }
//    
//    func removeTag(by id: String){
//        tags = tags.filter{$0.id != id }
//        getTags()
//    }
//}

//class TagViewModel : ObservableObject {
//    @Published var rows: [[Tag]] = []
//    @Published var tags: [Tag] = []
//    
//    
//    @Published var tagText = ""
//    
//    init() {
//        getTags()
//    }
//    
//    func getTags(){
//        
//        var rows: [[Tag]] = []
//        var currentRow: [Tag] = []
//        
//        var totalWidth: CGFloat = 0
//        let screenWidth = UIScreen.screenWidth - 10
//        let tagSpacing: CGFloat = 16 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
//        
//        
//        if !tags.isEmpty {
//            for index in 0..<tags.count {
//                self.tags[index].size = tags[index].name.getSize()
//            }
//            
//            tags.forEach { tag in
//                totalWidth += (tag.size + tagSpacing)
//                
//                if totalWidth > screenWidth {
//                    totalWidth = (tag.size + tagSpacing)
//                    rows.append(currentRow)
//                    currentRow.removeAll()
//                    currentRow.append(tag)
//                } else {
//                    currentRow.append(tag)
//                }
//               
//               
//            }
//            
//            if !currentRow.isEmpty {
//                rows.append(currentRow)
//                currentRow.removeAll()
//            }
//            self.rows = rows
//        } else {
//            self.rows = []
//        }
//    }
//    
//    func addTag() {
//        
//        let trimmedTagText = tagText.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !trimmedTagText.isEmpty else { return }
//        let isDuplicate = tags.contains { $0.name.caseInsensitiveCompare(trimmedTagText) == .orderedSame }
//        
//        if !isDuplicate {
//            tags.append(Tag(name: tagText))
//         
//            getTags()
//           
//        }
//        DispatchQueue.main.async {
//              self.tagText = ""
//          }
//        
//    }
//    
//    func removeTag(by id: String){
//        tags = tags.filter{$0.id != id }
//        getTags()
//    }
//}


