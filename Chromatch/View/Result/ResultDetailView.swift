// ResultDetailView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ResultDetailView: View {
    var result: String
    var confidence: Float
    
    @Binding var selectedTab: AppTab
    
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    let imageData: Data?
    var onRetry: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                getSeasonalBackground(result: result)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                VStack(spacing: 0) {
                    HeaderView(result: result, progressValue: $progressValue, confidence: confidence, imageData: imageData)
                    
                        ContentSectionsView(
                            result: result,
                            showExpandedPalette: $showExpandedPalette,
                            selectedTab: $selectedTab
                        )
                        .padding(.top)
                    

                    
                    Spacer()
                    
                    ActionButtonsView(
                        selectedTab: $selectedTab,
                        imageData: imageData,
                        result: result,
                        confidence: confidence,
                        onRetry: onRetry
                    )
                    .padding(.top)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
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



