// ResultDetailView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ResultDetailView: View {
    var result: String
    var confidence: Float
    
//    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    
    @State private var animateElements = false
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    let imageData: Data?
    
    var body: some View {
            // 1. Use a ZStack for layering the background and the scrollable content.
            ZStack {
                // The background sits on the bottom layer and fills the screen.
                getSeasonalBackground(result: result)
                    .ignoresSafeArea()

                // 2. Use a ScrollView to make your content scrollable.
                // It sits on top of the background.
                ScrollView {
                    // 3. Place your content in a VStack with natural spacing.
                    // REMOVE all the large negative paddings.
                    VStack(spacing: 20) { // Add some spacing for a cleaner look
                        HeaderView(result: result, animateElements: $animateElements, progressValue: $progressValue, confidence: confidence, imageData: imageData)
                        
                        ContentSectionsView(
                            result: result,
                            animateElements: $animateElements,
                            showExpandedPalette: $showExpandedPalette
                        )
                        
                        // The action buttons will now appear at the end of the
                        // scrollable content, which is the correct behavior.
                        ActionButtonsView(
                            selectedTab: $selectedTab, imageData: imageData, result: result, confidence: confidence
                        )
                        .padding(.bottom, 40) // Add some padding at the very bottom
                    }
                }
            }
            // Animate the content changes when the palette expands/collapses.
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: showExpandedPalette)
            .toolbar(.hidden, for: .navigationBar) // Use the modern way to hide the navigation bar
            .onAppear {
                startAnimations()
            }
        }
    
    private func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateElements = true
            
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                progressValue = confidence
            }
        }
    }
}


//// Preview
//struct ResultDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultDetailView(
//            result: "Spring",
//            confidence: 1.0,
//            isActive: .constant(true),
//            selectedTab: .constant(.home)
//        )
//    }
//}

