////
//////
//////  Navigation.swift
//////  Chromatch
//////
//////  Created by Felda Everyl on 12/06/25.
//////
////
////import SwiftUI
////
////import SwiftUI
////
////enum AppTab {
////    case home
////    case scan
////    case history
////}
////
////struct NavigationView: View {
////    @State private var selectedTab: AppTab = .home
////    @StateObject private var historyManager = HistoryManager()
////
////    var body: some View {
////        VStack(spacing: 0) {
////
////            Spacer()
////
////            // Current page
////            Group {
////                switch selectedTab {
////                case .home:
////                    HomeView()
////                case .scan:
////                    ResultView(selectedTab: $selectedTab)
////                case .history:
////                    HistoryView()
////                }
////            }
////            .frame(maxWidth: .infinity, maxHeight: .infinity)
////            .environmentObject(historyManager)
////
////            // Custom Tab Bar
////            MainTabView(selectedTab: $selectedTab)
////
////        }
////        .edgesIgnoringSafeArea(.all)
////
////    }
////
//////    func navigationTitle(for tab: AppTab) -> String {
//////        switch tab {
//////        case .home:
//////            return "Home"
//////        case .scan:
//////            return "Analyze"
//////        case .history:
//////            return "History"
//////        }
//////    }
////}
////
////struct MPreviews: PreviewProvider {
////    static var previews: some View {
////        NavigationView()
////    }
////}
////
//
//// NavigationRootView.swift
//import SwiftUI
//
//enum AppTab {
//    case home
//    case scan
//    case history
//}
//
//struct NavigationView: View {
//    @State private var selectedTab: AppTab = .home
//    @StateObject private var historyManager = HistoryManager()
//    @State private var isActive = false
//
//    var result: String
//    var confidence: Float
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Group {
//                switch selectedTab {
//                case .home:
//                    HomeView(result: result, confidence: confidence, isActive: $isActive, selectedTab: $selectedTab)
//                        .environmentObject(historyManager)
//                case .scan:
//                    ResultView(selectedTab: $selectedTab)
//                        .environmentObject(historyManager)
//                case .history:
//                    HistoryView()
//                        .environmentObject(historyManager)
//                }
//
//            }
//
//            MainTabView(selectedTab: $selectedTab)
//        }
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

struct NavigationView: View {
    @State private var selectedTab: AppTab = .home
    @StateObject private var historyManager = HistoryManager()
    @State private var isActive = false
    @StateObject private var appState = AppState()
    
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
                        HistoryView()
                    }
                }
                .environmentObject(historyManager)
                
                // Custom Navigation Title
                Text(navigationTitle(for: selectedTab))
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                    .padding(.top, 60)
            }
            
            if selectedTab != .scan {
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
            // Get the latest result to display in the title
            if let latestResult = historyManager.results.first {
                return "HOME / \(latestResult.result.uppercased())"
            } else {
                return "HOME"
            }
        case .scan:
            return "ANALYZE"
        case .history:
            return "HISTORY"
        }
    }
}
