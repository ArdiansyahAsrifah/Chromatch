//
//  ContentView.swift
//  Chromatch
//
//  Created by Felda Everyl on 12/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    var result: String = ""
    var confidence: Float = 0.0
    
    @State private var selectedTab: AppTab = .scan
    
    var body: some View {
        if hasCompletedOnboarding {
            MainContainer()
                .modelContainer(for: AnalysisResult.self)
        } else {
            Onboarding()
        }
    }
}
