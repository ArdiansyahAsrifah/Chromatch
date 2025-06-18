import SwiftUI

class AppState: ObservableObject {
    @Published var hasShownInitialPopup = false
}

enum AppTab {
    case home
    case scan
    case history
}

struct MainContainer: View {
    @State private var selectedTab: AppTab = .home
    @StateObject private var historyManager = HistoryManager()
    @State private var isActive = false
    @StateObject private var appState = AppState()
    @State private var isShowingExpandedColorView = false
    @State private var imageData: Data? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ZStack(alignment: .top) {
                // Navigation Bar
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView(isActive: $isActive, selectedTab: $selectedTab)
                        
                            
                    case .scan:
                        AnalyzeView(selectedTab: $selectedTab)
                           
                    case .history:
                        HistoryView(isActive: $isActive, selectedTab: $selectedTab, imageData: imageData)
                    }
                }
                .environmentObject(historyManager)
                
                // Custom Navigation Title
                Text(navigationTitle(for: selectedTab))
                    .font(.custom("Urbanist-Regular", size: 16).weight(.medium))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                    .padding(.top, 65)
            }
            
            if selectedTab != .scan && !isShowingExpandedColorView {
                MainTabView(selectedTab: $selectedTab)
            }

            
        }
        .environmentObject(appState)
        .ignoresSafeArea()
    }
    
    // Helper function to get the correct title for each tab
    private func navigationTitle(for tab: AppTab) -> String {
        switch tab {
        case .home:
            return "Home"
        case .scan:
            return "Analyze"
        case .history:
            return "History"
        }
    }
}

