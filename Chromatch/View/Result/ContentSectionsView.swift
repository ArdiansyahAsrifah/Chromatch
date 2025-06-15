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
    @Binding var animateElements: Bool
    @Binding var showExpandedPalette: Bool

    var body: some View {
        VStack(spacing: 20) {
            YourPaletteSection(
                result: result,
                animateElements: $animateElements,
                showExpandedPalette: $showExpandedPalette
            )
            if !showExpandedPalette {
                SeasonalTwinsSection(result: result, animateElements: $animateElements)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
















