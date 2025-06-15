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

enum AppTab {
    case home
    case scan
    case history
}

struct NavigationView: View {
    @State private var selectedTab: AppTab = .home
    @StateObject private var historyManager = HistoryManager()
    @State private var isActive = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView(isActive: $isActive, selectedTab: $selectedTab)
                        .environmentObject(historyManager)
                case .scan:
                    AnalyzeView(selectedTab: $selectedTab)
                        .environmentObject(historyManager)
                case .history:
                    HistoryView()
                        .environmentObject(historyManager)
                }
            }

            MainTabView(selectedTab: $selectedTab)
        }
    
        .edgesIgnoringSafeArea(.all)
    }
}
