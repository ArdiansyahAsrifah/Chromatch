// ActionButtonsView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ActionButtonsView: View {
   
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager

    let imageData: Data?
    var result: String
    var confidence: Float
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(spacing: 15) {
            SaveButton(
                result: result,
                confidence: confidence,
                imageData: imageData, isActive: $isActive,
                selectedTab: $selectedTab,
                presentationMode: presentationMode
            )
            .environmentObject(historyManager)

        }
        .padding(.horizontal, 25)
        .padding(.bottom, 30)
    }
}


