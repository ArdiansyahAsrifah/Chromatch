//
//  HistoryDetailView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 17/06/25.
//

import SwiftUI

struct HistoryDetailView: View {
    var result: ColorResult
    
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    
    @State private var animateElements = false
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    getSeasonalBackground(result: result.result)
                        .frame(width: 400, height: showExpandedPalette ? 2500 : 2000)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        HeaderView(
                            result: result.result,
                            animateElements: $animateElements,
                            progressValue: $progressValue,
                            confidence: result.confidence,
                            imageData: result.imageData
                        )
                        
                        ContentSectionsView(
                            result: result.result,
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
    }
    
    func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateElements = true
            
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                progressValue = result.confidence
            }
        }
    }
}
