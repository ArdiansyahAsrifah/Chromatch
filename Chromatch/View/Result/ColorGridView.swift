//
//  ColorGridView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ColorGridView: View {
    var result: String

    var body: some View {
        VStack(spacing: 12) {
            ForEach(0..<2) { rowIndex in
                HStack(spacing: 12) {
                    ForEach(0..<2) { columnIndex in
                        let index = rowIndex * 2 + columnIndex
                        let colorInfo = getTopRecommendedColors(result: result)[index]
                        ColorInfoView(colorInfo: colorInfo, index: index)
                    }
                }
            }
        }
    }
}

// Helper function to get top 4 recommended colors from all categories
func getTopRecommendedColors(result: String) -> [ColorInfo] {
    let categories = getColorCategories(for: result)
    var allColors: [ColorInfo] = []
    
    // Collect all colors from all categories
    for category in categories {
        allColors.append(contentsOf: category.colors)
    }
    
    // Return first 4 colors, or pad with default if less than 4
    let topColors = Array(allColors.prefix(4))
    
    // If we don't have enough colors, pad with defaults
    if topColors.count < 4 {
        var paddedColors = topColors
        let defaultColor = ColorInfo(color: "CCCCCC", name: "Default Gray", hex: "CCCCCC")
        
        while paddedColors.count < 4 {
            paddedColors.append(defaultColor)
        }
        return paddedColors
    }
    
    return topColors
}
