//
//  MainTab.swift
//  Chromatch
//
//  Created by Felda Everyl on 11/06/25.
//


import SwiftUI
import SwiftData

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            ResultView() 
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }

            HistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: AnalysisResult.self, inMemory: true)
}
