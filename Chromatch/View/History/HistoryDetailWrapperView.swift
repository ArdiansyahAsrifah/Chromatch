//
//  HistoryDetailWrapperView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 16/06/25.
//
import SwiftUI

struct HistoryDetailWrapperView: View {
    let colorResult: ColorResult
    @Binding var selectedTab: AppTab
    let imageData: Data?

    var body: some View {
        ResultDetailView(
            result: colorResult.result,
            confidence: colorResult.confidence,
            selectedTab: $selectedTab,
            imageData: imageData
        )
    }
}
