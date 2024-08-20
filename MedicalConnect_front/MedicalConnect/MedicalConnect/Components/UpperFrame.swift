//
//  UpperFrame.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 26/07/24.
//

import SwiftUI

struct UpperFrame: View {
    @State private var isLandscape: Bool = UIDevice.current.orientation.isLandscape
    let label: String
    var body: some View {

        VStack() {
        
                Text(label)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 0))
                        .font(Font.custom("Montserrat-Regular", size: 24))
                      
           
                    
            
            
        }
        .frame(height: isLandscape ? 40: 100)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("mainColor"))
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
            isLandscape = UIDevice.current.orientation.isLandscape
        })

   
            
    }
}

#Preview {
    UpperFrame(label: "Registrarme como")
}
