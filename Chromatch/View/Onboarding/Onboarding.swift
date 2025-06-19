import SwiftUI

struct Onboarding: View {
    @State private var currentPageIndex = 0
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false
    
    
    private let totalPages = 2
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // TabView Fullscreen
//            Group {
//                if currentPageIndex == 0 {
//                    AnyView(OnboardPageFirstView())
//                } else if currentPageIndex == 1 {
//                    AnyView(OnboardPageSecondView())
//                } else if currentPageIndex == 2 {
//                    AnyView(OnboardPageThirdView())
//                    
//                }
//            }
//            .transition(.slide)
//            .animation(.easeInOut, value: currentPageIndex)
//            .ignoresSafeArea()
            
            ZStack {
                            if currentPageIndex == 0 {
                                OnboardPageFirstView()
                                    .transition(.opacity)
                            }
                            if currentPageIndex == 1 {
                                OnboardPageSecondView()
                                    .transition(.opacity)
                            }
//                            if currentPageIndex == 2 {
//                                OnboardPageThirdView()
//                                    .transition(.opacity)
//                            }
                        }
                        .animation(.easeInOut, value: currentPageIndex)
            
            VStack {
                // Skip button
                HStack {
                    Spacer()
                    Button("Skip") {
                        hasCompletedOnboarding = true
                    }
                    .padding(.top, 4)
                    .padding(.trailing, 10)
                }
                Spacer()
                
                if(currentPageIndex != 2){
                    ProgressBar(currentPage: currentPageIndex)
                        .padding(.bottom, 8)

                    
                    // Continue Button
                    Button(action: {
                        if currentPageIndex < totalPages - 1 {
                            withAnimation {
                                currentPageIndex += 1
                            }
                        } else {
                            hasCompletedOnboarding = true
                        }
                    }) {
                        
                        Text(currentPageIndex == totalPages - 1 ? "Continue to Home" : "Continue")
                            .font(.custom("Urbanist-Regular", size: 18).weight(.medium))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.black)
                            .opacity(0.8)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom)
                    
                }
                
                
            }
        }
    }
}

//#Preview {
//    Onboarding()
//}
