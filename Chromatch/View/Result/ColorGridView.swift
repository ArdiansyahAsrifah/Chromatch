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
        let signatureColors = getColorSeason(result: result)
        
        VStack(spacing: 12) {
            ForEach(0..<2) { rowIndex in
                HStack(spacing: 12) {
                    ForEach(0..<2) { columnIndex in
                        let index = rowIndex * 2 + columnIndex
                        if index < signatureColors.count {
                            let colorInfo = signatureColors[index]
                            ColorInfoView(colorInfo: colorInfo, index: index)
                        }
                    }
                }
            }
        }
    }
}

func getColorSeason(result: String) -> [ColorInfo] {
    // This function should return the season based on the result.
    // Get specific color from color categories
    switch result.lowercased() {
    case "spring":
        return [
            ColorInfo(color: "FFFFF0", name: "Ivory", hex: "FFFFF0"),
            ColorInfo(color: "FFEA00", name: "Bright Yellow", hex: "FFEA00"),
            ColorInfo(color: "F88379", name: "Coral Pink", hex: "F88379"),
            ColorInfo(color: "AFEEEE", name: "Light Turquoise", hex: "AFEEEE"),
        ]
    case "summer":
        return [
            ColorInfo(color: "20B2AA", name: "Light Sea Green", hex: "20B2AA"),
            ColorInfo(color: "87CEEB", name: "Sky Blue", hex: "87CEEB"),
            ColorInfo(color: "FFB6C1", name: "Light Pink", hex: "FFB6C1"),
            ColorInfo(color: "E6E6FA", name: "Lavender", hex: "E6E6FA"),
        ]
    case "autumn":
        return [
            ColorInfo(color: "6A040F", name: "Deep Burgundy", hex: "6A040F"),
            ColorInfo(color: "808000", name: "Olive", hex: "808000"),
            ColorInfo(color: "654321", name: "Dark Brown", hex: "654321"),
            ColorInfo(color: "DE8C3C", name: "Autumn", hex: "DE8C3C"),
        ]
    case "winter":
        return [
            ColorInfo(color: "FFFAFA", name: "Snow", hex: "FFFAFA"),
            ColorInfo(color: "FF0000", name: "True Red", hex: "FF0000"),
            ColorInfo(color: "0000FF", name: "Blue", hex: "0000FF"),
            ColorInfo(color: "049D49", name: "Emerald", hex: "049D49")
        ]
    default:
        return [
            ColorInfo(color: "CCCCCC", name: "Light Gray", hex: "#CCCCCC"),
            ColorInfo(color: "999999", name: "Medium Gray", hex: "#999999"),
            ColorInfo(color: "666666", name: "Dark Gray", hex: "#666666"),
            ColorInfo(color: "333333", name: "Charcoal", hex: "#333333")
        ]
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
