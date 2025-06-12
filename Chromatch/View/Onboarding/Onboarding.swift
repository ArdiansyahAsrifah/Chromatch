import SwiftUI

struct Onboarding: View {
    @State private var currentPageIndex = 0
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false

    
    private let totalPages = 3
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Skip") {
                    print("Onboarding skipped")
                }
            }
            .padding()
            
            // TabView Untuk Swiping Antar Page
            TabView(selection: $currentPageIndex) {
                OnboardPageFirstView()
                    .tag(0)
                
                OnboardPageSecondView()
                    .tag(1)
                
                OnboardPageThirdView()
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Tombol Continue untuk antar pages
            Button(action: {
                if currentPageIndex < totalPages - 1 {
                    withAnimation {
                        currentPageIndex += 1
                    }
                } else {
                    hasCompletedOnboarding = true
                }
            }) {
                Text(currentPageIndex == totalPages - 1 ? "Continue to Analysis" : "Continue")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.idleBTStart, .idleBTStart]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            .padding(.horizontal, 40)
            .padding(.bottom)
            
            // Page Control
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

#Preview {
    Onboarding()
}

