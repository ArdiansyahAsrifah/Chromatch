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

    var body: some View {
        VStack(spacing: 8) {
            YourPaletteSection(
                result: result,
                showExpandedPalette: $showExpandedPalette
            )
            if !showExpandedPalette {
                SeasonalTwinsSection(result: result)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
















