//
//  MainTab.swift
//  Chromatch
//
//  Created by Felda Everyl on 11/06/25.
//


import SwiftUI
import SwiftData

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)

            ResultView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                .tag(1)

            HistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: AnalysisResult.self, inMemory: true)
}
