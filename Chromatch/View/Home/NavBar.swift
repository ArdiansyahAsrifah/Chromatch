
//
//  Navigation.swift
//  Chromatch
//
//  Created by Felda Everyl on 12/06/25.
//

import SwiftUI
import Combine

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
    @State private var isActive: Bool = false
    @StateObject private var appState = AppState()
    
    var body: some View {
        VStack(spacing: 0) {
            if selectedTab != .scan {
                HStack (alignment: .center, spacing: 2){
                    Text(navigationTitle(for: selectedTab))
                        .font(.body)
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 40)
                .background(.black.opacity(0.5))
                .cornerRadius(20)
                .padding(.horizontal, 24)
                .padding(.top, 60)
            }
            
            Spacer()
            
            // Current page
            Group {
                switch selectedTab {
                case .home:
                    HomeView(isActive:$isActive, selectedTab: $selectedTab)
                case .scan:
                    ResultView(selectedTab: $selectedTab)
                case .history:
                    HistoryView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Tab Bar
            if selectedTab != .scan {
                MainTabView(selectedTab: $selectedTab)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(appState)
        
    }
    
    func navigationTitle(for tab: AppTab) -> String {
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

struct MPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}

