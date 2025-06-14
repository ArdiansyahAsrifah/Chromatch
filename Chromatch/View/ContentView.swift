//
//  ContentView.swift
//  Chromatch
//
//  Created by Felda Everyl on 12/06/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var body: some View {
        if hasCompletedOnboarding {
            NavigationView()
                .modelContainer(for: AnalysisResult.self)
        } else {
            Onboarding()
        }
    }
}
