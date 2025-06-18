//// ContentSectionsView.swift
//// Chromatch
////
//// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

// ResultDetailView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct ContentSectionsView: View {
    var result: String
    @Binding var showExpandedPalette: Bool
    @Binding var selectedTab: AppTab

    var body: some View {
        VStack(spacing: 8) {
            NavigationLink(
                destination: ExpandedColorView(result: result, selectedTab: $selectedTab, isShowingExpandedPalette: $showExpandedPalette),
                isActive: $showExpandedPalette
            ) {
                EmptyView()
            }
            .hidden()
            
            YourPaletteSection(
                result: result,
                showExpandedPalette: $showExpandedPalette,
                selectedTab: $selectedTab
            )
            
            if !showExpandedPalette {
                SeasonalTwinsSection(result: result)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

















