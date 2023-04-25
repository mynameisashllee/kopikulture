import SwiftUI

struct RealEndView: View {
    @State private var showCredits = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                if showCredits {
                    CreditsView()
                } else {
                    Text("Thank you!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .transition(.move(edge: .top))
                }
                
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showCredits = true
                }
            }
        }
    }
}



struct CreditsView: View {
    
    @State private var creditsOffset: CGFloat = UIScreen.main.bounds.height
    @State private var shouldAnimate = false
    
    var body: some View {
        VStack {
            Text("visit")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 40)
            Text("nhb.gov.sg")
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 40)
            Text("to find out more")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 40)
        }
        .opacity(shouldAnimate ? 1 : 0)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                self.shouldAnimate = true
            }
        }
    }
}
