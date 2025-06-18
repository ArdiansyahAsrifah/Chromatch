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
    @State private var selectedResult: ColorResult? = nil
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                getSeasonalBackground(result: result.result)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HeaderView(
                        result: result.result,
                        progressValue: $progressValue,
                        confidence: result.confidence,
                        imageData: result.imageData
                    )
                    .padding(.top,30)
                    
                    ContentSectionsView(
                        result: result.result,
                        showExpandedPalette: $showExpandedPalette,
                        selectedTab: $selectedTab
                    )
                    .padding(.top)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
//            }.sheet(item: $selectedResult) { result in
//                ExpandedColorView(result: result.result, selectedTab: $selectedTab, isShowingExpandedPalette: $showExpandedPalette)
            }
            
        }
        
        
        .navigationBarHidden(true)
        
    }
    
}

