import SwiftUI

struct Onboarding: View {
    @State private var currentPageIndex = 0
    
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
                    print("Go to Analysis Page!")
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


struct OnboardPageFirstView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Gabungin Dua Teks dengan Gradient
            (
                Text("Welcome to ")
                +
                Text("Chromatch!")
                // Style khusus (gradien) kata terakhir
                    .foregroundStyle(
                        LinearGradient(colors: [.idleBTStart, .idleBTEnd], startPoint: .leading, endPoint: .trailing)
                    )
            )
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, -30)
            
            Text("A place to discover your seasonal color")
                .font(.body)
                .foregroundColor(.secondary)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.pink.opacity(0.8))
                .frame(width: 250, height: 250)
                .padding(.vertical, 40)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}


struct OnboardPageSecondView: View {
    
    //Buat Gridnya
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("What is the\n\(Text("Seasonal Color?").foregroundStyle(Color.red.opacity(0.8)))")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("It's what makes you unique - Your skintone")
                .font(.body)
                .foregroundColor(.secondary)
            
            // Grid 2x2
            LazyVGrid(columns: columns, spacing: 40) {
                SeasonalItemView(imageName: "leaf.fill", seasonName: "Spring", color: .green)
                SeasonalItemView(imageName: "flame.fill", seasonName: "Autumn", color: .orange)
                SeasonalItemView(imageName: "drop.fill", seasonName: "Summer", color: .blue)
                SeasonalItemView(imageName: "snowflake", seasonName: "Winter", color: .cyan)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
struct SeasonalItemView: View {
    var imageName: String
    var seasonName: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .foregroundColor(color)
                .frame(height: 150)
            
            Text(seasonName)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
    }
}

struct OnboardPageThirdView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Let's find Yours!")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("Scan your face now to find out")
                .font(.body)
                .foregroundColor(.secondary)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.pink.opacity(0.8))
                .frame(width: 250, height: 250)
                .padding(.vertical, 40)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}


#Preview {
    Onboarding()
}

