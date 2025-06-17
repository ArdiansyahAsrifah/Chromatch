import SwiftUI

struct Onboarding: View {
    @State private var currentPageIndex = 0
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false

    private let totalPages = 3

    var body: some View {
        ZStack(alignment: .topTrailing) {
            // TabView Fullscreen
            TabView(selection: $currentPageIndex) {
                OnboardPageFirstView()
                    .tag(0)
                OnboardPageSecondView()
                    .tag(1)
                OnboardPageThirdView()
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            VStack {
                // Skip button
                HStack {
                    Spacer()
                    Button("Skip") {
                        hasCompletedOnboarding = true
                    }
                    .padding()
                }
                Spacer()
                
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

                // Page indicator
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(index == currentPageIndex ? Color.primary : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    Onboarding()
}
