// HomeView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 14/06/25.

import SwiftData
import SwiftUI

struct HomeView: View {
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager
    
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    
    
    // Computed properties untuk mendapatkan data terbaru
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
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    getSeasonalBackground(result: displayResult)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        HeaderView(
                            result: displayResult,
                            progressValue: $progressValue,
                            confidence: displayConfidence,
                            imageData: displayImageData
                        )
                        .padding(.top,30)
                        
                        ContentSectionsView(
                            result: displayResult,
                            showExpandedPalette: $showExpandedPalette,
                            selectedTab: $selectedTab
                        )
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        
            
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            isActive: .constant(true),
            selectedTab: .constant(.home)
        )
        .environmentObject(HistoryManager())
    }
}
