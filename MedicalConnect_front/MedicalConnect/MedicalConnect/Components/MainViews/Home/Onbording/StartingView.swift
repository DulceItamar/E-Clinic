//
//  ContentView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 25/07/24.
//

import SwiftUI

struct StartingView: View {
    @StateObject private var onboardingManager = OnboardingManager()
    @State private var nextViewButton: Bool = false
    @State private var isLandscape: Bool = UIDevice.current.orientation.isLandscape
    var body: some View {
        
        NavigationStack {
            VStack(spacing: isLandscape ? 20 : 150) {
                
                VStack{
                    Image("LOGO")
                        .resizable()
                        .scaledToFit()
                       
                }
                

                Button(action: {
                    nextViewButton = true
                }, label: {
                    Text("Comenzar")
                        .padding(.horizontal, 24)
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                        .kerning(1.2)
                })
                .buttonStyle(MainButtonStyle(isEnabled: true))
                .padding(.bottom,20)
               
            }
            .navigationDestination(isPresented: $nextViewButton, destination: {
                OnboardingView()
                    .navigationBarBackButtonHidden()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(content: {
                LinearGradient(gradient: Gradient(colors:[Color("babyBlue-100"), Color("babyBlue-200")]), startPoint: .top, endPoint: .bottom)
            })
            .ignoresSafeArea()
                
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
            isLandscape = UIDevice.current.orientation.isLandscape
        })
    }
}

#Preview {
    StartingView()
}
