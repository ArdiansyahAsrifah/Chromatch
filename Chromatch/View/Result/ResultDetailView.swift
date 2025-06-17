// ResultDetailView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ResultDetailView: View {
    var result: String
    var confidence: Float
    
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    
    @State private var animateElements = false
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    let imageData: Data?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    getSeasonalBackground(result: result)
                        .frame(width: 400, height: showExpandedPalette ? 2500 : 2000)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        HeaderView(result: result, animateElements: $animateElements, progressValue: $progressValue, confidence: confidence, imageData: imageData)
                        
                        
                        ContentSectionsView(
                            result: result,
                            animateElements: $animateElements,
                            showExpandedPalette: $showExpandedPalette
                        )
                        .padding(.top, showExpandedPalette ? -1000 : -750)
                        
                        

                        
                        ActionButtonsView(
                            isActive: $isActive, selectedTab: $selectedTab, imageData: imageData, result: result, confidence: confidence
                        )
                        
                        .padding(.top, showExpandedPalette ? -650 : -1120)
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
    
    private func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateElements = true
            
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                progressValue = confidence
            }
        }
    }
}


// Preview
//struct ResultDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultDetailView(
//            result: "Spring",
//            confidence: 1.0,
//            isActive: .constant(true),
//            selectedTab: .constant(.home),
//            imageData: "person.circle"
//        )
//    }
//}

