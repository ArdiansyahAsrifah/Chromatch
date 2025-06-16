//// HomeView.swift
//// Chromatch
////
//// Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//
//import SwiftUI
//
//struct HomeView: View {
//    var result: String
//    var confidence: Float
//    
//    @Binding var isActive: Bool
//    @Binding var selectedTab: AppTab
//    
//    @State private var animateElements = false
//    @State private var progressValue: Float = 0.0
//    @State private var showExpandedPalette = false
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView {
//                ZStack {
//                    getSeasonalBackground(result: result)
//                        .frame(width: 400, height: showExpandedPalette ? 2500 : 2000)
//                        .edgesIgnoringSafeArea(.all)
//
//                    VStack(spacing: 0) {
//                        HeaderView(result: result, animateElements: $animateElements, progressValue: $progressValue, confidence: confidence)
//                        
//                        ContentSectionsView(
//                            result: result,
//                            animateElements: $animateElements,
//                            showExpandedPalette: $showExpandedPalette
//                        )
//                        .padding(.top, showExpandedPalette ? -1000 : -750)
//                        
//            
//                    }
//                }
//            }
//            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: showExpandedPalette)
//        }
//        .navigationBarHidden(true)
//        .onAppear {
//            startAnimations()
//        }
//    }
//    
//    private func startAnimations() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            animateElements = true
//            
//            // Animate progress value
//            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
//                progressValue = confidence
//            }
//        }
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(
//            result: "Spring",
//            confidence: 0.92,
//            isActive: .constant(true),
//            selectedTab: .constant(.home)
//        )
//    }
//}

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
    
    @State private var animateElements = false
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
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    getSeasonalBackground(result: displayResult)
                        .frame(width: 400, height: showExpandedPalette ? 2500 : 2000)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        Spacer(minLength: 50)
                        HeaderView(
                            result: displayResult,
                            animateElements: $animateElements,
                            progressValue: $progressValue,
                            confidence: displayConfidence,
                            imageData: displayImageData
                        )
                        
                        ContentSectionsView(
                            result: displayResult,
                            animateElements: $animateElements,
                            showExpandedPalette: $showExpandedPalette
                        )
                        .padding(.top, showExpandedPalette ? -1000 : -750)
                    }
                    
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: showExpandedPalette)
        }
        .navigationBarHidden(true)
        .onAppear {
            startAnimations()
        }
        .onChange(of: selectedTab) { newTab in
            // Reset animasi ketika tab berubah ke home
            if newTab == .home {
                resetAndStartAnimations()
            }
        }
    }
    
    private func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateElements = true
            
            // Animate progress value
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                progressValue = displayConfidence
            }
        }
    }
    
    private func resetAndStartAnimations() {
        // Reset animasi
        animateElements = false
        progressValue = 0.0
        
        // Mulai animasi lagi
        startAnimations()
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
