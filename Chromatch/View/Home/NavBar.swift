//
//import SwiftUI
//
//class AppState: ObservableObject {
//    @Published var hasShownInitialPopup = false
//}
//
//enum AppTab {
//    case home
//    case scan
//    case history
//}
//
//struct MainContainer: View {
//    @State private var selectedTab: AppTab = .home
//    @StateObject private var historyManager = HistoryManager()
//    @State private var isActive = false
//    @StateObject private var appState = AppState()
//    
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Group {
//                switch selectedTab {
//                case .home:
//                    HomeView(isActive: $isActive, selectedTab: $selectedTab)
//                        .environmentObject(historyManager)
//                case .scan:
//                    AnalyzeView(selectedTab: $selectedTab)
//                        .environmentObject(historyManager)
//                case .history:
//                    HistoryView(isActive: $isActive, selectedTab: $selectedTab)
//                        .environmentObject(historyManager)
//                }
//            }
//            
//            if selectedTab != .scan {
//                MainTabView(selectedTab: $selectedTab)
//            }
//        }
//        .environmentObject(appState)
//        .edgesIgnoringSafeArea(.all)
//    }
//}

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
    @State private var imageData: Data? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Remove Group and use the switch directly
            switch selectedTab {
            case .home:
                HomeView(isActive: $isActive, selectedTab: $selectedTab)
                    .environmentObject(historyManager)
            case .scan:
                AnalyzeView(selectedTab: $selectedTab)
                    .environmentObject(historyManager)
            case .history:
                HistoryView(isActive: $isActive, selectedTab: $selectedTab, imageData: imageData)
                    .environmentObject(historyManager)
            }
            
            if selectedTab != .scan {
                MainTabView(selectedTab: $selectedTab)
            }
        }
        .environmentObject(appState)
        .edgesIgnoringSafeArea(.all)
    }
}
