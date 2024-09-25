/// A SwiftUI view that displays a starting screen with a logo and button to proceed.
///
///The `StartingView` is used as an introductory screen with a fading effect for transitioning
/// to the next view in the app. It dynamically adjusts its layout based on the orientation
/// of the device (landscape or portrait).
///
///  The view includes:
/// - A logo at the top, which scales to fit the available space.
/// - A "Comenzar" (Start) button that triggers the transition to another view.
/// - A gradient background that spans the entire screen.
///
/// The layout adjusts based on the orientation of the device, adding more or less spacing between
/// the logo and button depending on whether the device is in landscape or portrait mode.
///
/// - Parameters:
///   - showStartingView: A binding boolean that controls whether the `StartingView` is visible.
///     It will be set to `false` when the user presses the "Comenzar" button.
///   - opacity: A double state variable that controls the view opacity when navigate to `OnboardingView`
///   - isLandscape: A state variable that tracks the current device orientation (landscape or portrait.)


import SwiftUI

struct StartingView: View {
    
    @Binding  var showStartingView: Bool
    @State private var opacity: Double = 1.0
    
    @State private var isLandscape: Bool = UIDevice.current.orientation.isLandscape
    var body: some View {
        
        VStack(spacing: isLandscape ? 20 : 150) {
            
            VStack{
                Image("LOGO")
                    .resizable()
                    .scaledToFit()
            }
            
            Button(action: {
                
                withAnimation(.easeOut(duration: 0.30)) {
                    opacity = 0.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                    showStartingView = false
                }
                
            }, label: {
                Text("Comenzar")
                    .padding(.horizontal, 24)
                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                    .kerning(1.2)
            })
            .buttonStyle(MainButtonStyle(isEnabled: true))
            .padding(.bottom,20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(content: {
            LinearGradient(gradient: Gradient(colors:[Color("babyBlue-100"), Color("babyBlue-200")]), startPoint: .top, endPoint: .bottom)
        })
        .ignoresSafeArea()
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
            isLandscape = UIDevice.current.orientation.isLandscape
        })
    }
}

#Preview {
    @Previewable @State var showView:Bool = true
    return StartingView(showStartingView: $showView)
}
