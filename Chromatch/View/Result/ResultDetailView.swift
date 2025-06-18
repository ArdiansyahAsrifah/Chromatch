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

    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    let imageData: Data?
    
    var body: some View {
            ScrollView {
                ZStack {
                    getSeasonalBackground(result: result)
                        .frame(width: 400)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        HeaderView(result: result, progressValue: $progressValue, confidence: confidence, imageData: imageData)
                        
                        ContentSectionsView(
                            result: result,

                            showExpandedPalette: $showExpandedPalette
                        )
                        .padding(.top)
                        
                        ActionButtonsView(
                            isActive: $isActive, selectedTab: $selectedTab, imageData: imageData, result: result, confidence: confidence
                        )
                        
                        .padding(.top)
                    }
                }
            }
        .navigationBarHidden(true)
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




