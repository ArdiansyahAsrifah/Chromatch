//
//  ColorInfo.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import Foundation
import SwiftUI

// Define the ColorInfo struct to hold color details
struct ColorInfo {
    var color: Color
    var name: String
    var hex: String
}

struct ColorCategory {
    var title: String
    var colors: [ColorInfo]
}

// Helper function to get color categories - you'll need to implement this based on your color data
func getColorCategories(for result: String) -> [ColorCategory] {
    // This is a placeholder - replace with your actual color data logic
    return [
        ColorCategory(title: "Neutrals", colors: [
            ColorInfo(color: .gray, name: "Warm Gray", hex: "8B7D7D"),
            ColorInfo(color: .brown, name: "Taupe", hex: "A0876E"),
            ColorInfo(color: Color(red: 0.7, green: 0.6, blue: 0.5), name: "Mushroom", hex: "B39A8A"),
            ColorInfo(color: Color(red: 0.9, green: 0.85, blue: 0.8), name: "Cream", hex: "E6D8CC")
        ]),
        ColorCategory(title: "Metallics", colors: [
            ColorInfo(color: Color(red: 0.8, green: 0.7, blue: 0.4), name: "Gold", hex: "CCB366"),
            ColorInfo(color: Color(red: 0.7, green: 0.5, blue: 0.3), name: "Bronze", hex: "B3804D"),
            ColorInfo(color: Color(red: 0.6, green: 0.4, blue: 0.2), name: "Copper", hex: "996633"),
            ColorInfo(color: Color(red: 0.9, green: 0.8, blue: 0.6), name: "Champagne", hex: "E6CC99")
        ]),
        ColorCategory(title: "Brights", colors: [
            ColorInfo(color: .orange, name: "Burnt Orange", hex: "CC5500"),
            ColorInfo(color: .red, name: "Deep Red", hex: "8B0000"),
            ColorInfo(color: Color(red: 0.8, green: 0.4, blue: 0.0), name: "Rust", hex: "CC6600"),
            ColorInfo(color: Color(red: 0.6, green: 0.2, blue: 0.0), name: "Terracotta", hex: "993300")
        ]),
        ColorCategory(title: "Pinks & Reds", colors: [
            ColorInfo(color: Color(red: 0.8, green: 0.4, blue: 0.4), name: "Dusty Rose", hex: "CC6666"),
            ColorInfo(color: Color(red: 0.7, green: 0.3, blue: 0.3), name: "Mauve", hex: "B34D4D"),
            ColorInfo(color: Color(red: 0.6, green: 0.2, blue: 0.2), name: "Burgundy", hex: "993333"),
            ColorInfo(color: Color(red: 0.9, green: 0.6, blue: 0.6), name: "Blush", hex: "E69999")
        ])
    ]
}
