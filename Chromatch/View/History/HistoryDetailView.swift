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
    
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ScrollView {
                ZStack {
                    getSeasonalBackground(result: result.result)
                        .frame(width: 400)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 0) {
                        HeaderView(
                            result: result.result,
                            progressValue: $progressValue,
                            confidence: result.confidence,
                            imageData: result.imageData
                        )
                        
                        ContentSectionsView(
                            result: result.result,
                            showExpandedPalette: $showExpandedPalette
                        )
                        .padding(.top)

                    }
                }
            }
        .navigationBarHidden(true)

    }

}
