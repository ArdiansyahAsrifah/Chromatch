//
//  ExpandedPaletteView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 18/06/25.
//

import SwiftUI

struct ExpandedPaletteView: View {
    var result: String

    @EnvironmentObject var historyManager: HistoryManager
    
    private var latestResult: ColorResult? {
        historyManager.results.first
    }
    
    private var displayResult: String {
        latestResult?.result ?? "No Result"
    }
    
    private var displayConfidence: Float {
        latestResult?.confidence ?? 0.0
    }
    
    private var displayImageData: Data? {
        latestResult?.imageData
    }
    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 24) {
//                // Header Section
//                VStack(spacing: 8) {
//                    Text("Your Palette")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                    
//                    Text("Colors that flatter your tone")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//                .padding(.top, 20)
//                
//                // Content
//                ExpandedColorView(result: result)
//            }
//            .padding(.horizontal, 20)
//            .padding(.bottom, 40)
//        }
//        .background(Color(.systemGray6))
//        .navigationTitle("Detail")
//        .navigationBarTitleDisplayMode(.inline)
//    }
    
    var body: some View {
        ZStack {
            getSeasonalBackground(result: result)
                ignoresSafeArea()

        }
    }
}
