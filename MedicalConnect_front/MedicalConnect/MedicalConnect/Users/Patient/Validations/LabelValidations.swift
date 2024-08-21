//
//  LabelValidations.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 21/08/24.
//

import SwiftUI

struct LabelValidations: View {
    let typeOfField: TypeOfValidationFieldData
    let isValid: Bool
  
    var body: some View {

        Label(validationTextLabel(type: typeOfField, isValid: isValid), systemImage: validationImage(isValid: isValid))
            .foregroundStyle(isValid ? .main : .red)
            .font(Font.custom("Montserrat-Regular", size: 14))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }

}


extension LabelValidations {
        
    func validationImage( isValid: Bool) -> String {
        switch isValid {
            case true:
                return "checkmark.circle.fill"
            case false:
                return "x.circle.fill"
                
        }
    }
    
    
    func validationTextLabel (type data: TypeOfValidationFieldData, isValid: Bool) -> String {
        switch isValid {
            case true:
                return "\(data.textLabel) válido"
            case false:
                return "\(data.textLabel) no válido"
        }
    }
    
}

#Preview {
    LabelValidations(typeOfField: .email, isValid: true)
}






//
enum TypeOfValidationFieldData {
    
    case password
    case email
    
    
    var textLabel: String {
        switch self {
            case .password:
                "Password"
            case .email:
                "Email"
        }
    }
    
    
}

