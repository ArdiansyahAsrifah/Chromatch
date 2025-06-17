// HeaderView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct HeaderView: View {
    var result: String
    @Binding var animateElements: Bool
    @Binding var progressValue: Float
    var confidence: Float
    let imageData: Data?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ProfileAndProgressView(animateElements: $animateElements, progressValue: $progressValue, confidence: confidence, imageData: imageData)
                
                SeasonTitleAndDescriptionView(result: result, animateElements: $animateElements)
                
                Spacer()
            }
        }
    }
}

//struct HeaderPreviewWrapper: View {
//    @State private var animateElements = true
//    @State private var progressValue: Float = 0.85
//    
//    var body: some View {
//        HeaderView(
//            result: "Summer",
//            animateElements: $animateElements,
//            progressValue: $progressValue,
//            confidence: 0.85,
//            imageData: "person.fill"
//        )
//    }
//}
//
//#Preview {
//    HeaderPreviewWrapper()
//}

