//
//  ContentView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 09/06/25.
//

import SwiftData
import SwiftUI


struct HomeView: View {
    @Query(sort: \AnalysisResult.date, order: .reverse)
    private var latestResults: [AnalysisResult]

    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab

    var body: some View {
        VStack {
            let result = latestResults.first?.season
            let confidence = Double(latestResults.first!.confidence)
            ResultDetailView(
                result: result!,
                confidence: Float(confidence),
                isActive: $isActive,
                selectedTab: $selectedTab
            )
        }
    }
}

