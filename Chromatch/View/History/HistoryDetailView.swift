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
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss
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
                    .padding(.top,45)
                    
                    ContentSectionsView(
                        result: result.result,
                        showExpandedPalette: $showExpandedPalette,
                        selectedTab: $selectedTab
                    )
                    .padding(.top)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
                VStack {
                    HStack {
                        Button(action: {
                            // 2. The correct action is to dismiss the current view.
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title3.weight(.medium))
                                .foregroundColor(.primary)
                                .padding(12)
                                .background(.thinMaterial)
                                .clipShape(Circle())
                        }
                        .padding(.leading, 20)
                        
                        Spacer() // Pushes the button to the left
                    }
                    Spacer() // Pushes the HStack to the top
                }
                //            }.sheet(item: $selectedResult) { result in
                //                ExpandedColorView(result: result.result, selectedTab: $selectedTab, isShowingExpandedPalette: $showExpandedPalette)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            // set tab bar hidden
            appState.isTabBarHidden = true
        }
        .onDisappear {
            // reset tab bar visibility
            appState.isTabBarHidden = false
        }
    }
    
}

