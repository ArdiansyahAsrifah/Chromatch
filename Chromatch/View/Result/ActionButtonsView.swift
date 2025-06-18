// ActionButtonsView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ActionButtonsView: View {
   
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager

    let imageData: Data?
    var result: String
    var confidence: Float
    @Environment(\.presentationMode) var presentationMode
    
    var onRetry: (() -> Void)?
    
    var body: some View {
        HStack{
            if let onRetry = onRetry {
                Button(action: onRetry) { // Use the unwrapped action
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.primary)
                        .frame(width: 60, height: 60)
                        .background(.white)
                        .clipShape(Circle())
                }
            }
            
            SaveButton(
                result: result,
                confidence: confidence,
                imageData: imageData,
                selectedTab: $selectedTab,
                presentationMode: presentationMode
            )
            .environmentObject(historyManager)

        }
    }
}

