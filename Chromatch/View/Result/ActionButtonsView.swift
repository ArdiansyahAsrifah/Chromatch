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
        HStack(spacing: 15) {
            if let onRetry = onRetry {
                Button(action: onRetry) { // Use the unwrapped action
                    HStack {
                        Image(systemName: "arrow.clockwise")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.secondary.opacity(0.3))
                    .foregroundColor(.primary)
                    .cornerRadius(12)
                    .font(.headline)
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
            .frame(maxWidth: .infinity)

        }
        .padding(.horizontal, 25)
        .padding(.bottom, 30)
    }
}


