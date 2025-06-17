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
    var color: String
    var name: String
    var hex: String
}

struct ColorCategory {
    var title: String
    var colors: [ColorInfo]
}

func getColorCategories(for result: String) -> [ColorCategory] {
    switch result.lowercased() {
    case "spring":
        return [
            ColorCategory(title: "Neutrals", colors: [
                ColorInfo(color: "FFFFF0", name: "Ivory", hex: "FFFFF0"),
                ColorInfo(color: "F5F5DC", name: "Light Beige", hex: "F5F5DC"),
                ColorInfo(color: "FFFDD0", name: "Cream", hex: "FFFDD0"),
                ColorInfo(color: "D2B48C", name: "Tan", hex: "D2B48C")
            ]),
            ColorCategory(title: "Metallics", colors: [
                ColorInfo(color: "FFD700", name: "Gold", hex: "FFD700"),
                ColorInfo(color: "CBA3B2", name: "Rose Gold", hex: "CBA3B2")
            ]),
            ColorCategory(title: "Brights", colors: [
                ColorInfo(color: "00FF7F", name: "Spring Green", hex: "00FF7F"),
                ColorInfo(color: "40E0D0", name: "Turquoise", hex: "40E0D0"),
                ColorInfo(color: "FF7F50", name: "Coral", hex: "FF7F50"),
                ColorInfo(color: "FFEA00", name: "Bright Yellow", hex: "FFEA00")
            ]),
            ColorCategory(title: "Pinks & Reds", colors: [
                ColorInfo(color: "F88379", name: "Coral Pink", hex: "F88379"),
                ColorInfo(color: "E89EB8", name: "Soft Pink", hex: "E89EB8"),
                ColorInfo(color: "FF7782", name: "Blush Pink", hex: "FF7782"),
                ColorInfo(color: "FFD6D1", name: "Rosewater", hex: "FFD6D1")
            ]),
            ColorCategory(title: "Yellows & Oranges", colors: [
                ColorInfo(color: "FFFD74", name: "Butter Yellow", hex: "FFFD74"),
                ColorInfo(color: "FFD3AC", name: "Peach", hex: "FFD3AC"),
                ColorInfo(color: "FAFAD2", name: "Light Goldenrod", hex: "FAFAD2"),
                ColorInfo(color: "FFB27F", name: "Apricot", hex: "FFB27F")
            ]),
            ColorCategory(title: "Greens", colors: [
                ColorInfo(color: "32CD32", name: "Lime Green", hex: "32CD32"),
                ColorInfo(color: "6B8E23", name: "Olive Drab", hex: "6B8E23"),
                ColorInfo(color: "8A9A5B", name: "Moss Green", hex: "8A9A5B"),
                ColorInfo(color: "9ACD32", name: "Yellow Green", hex: "9ACD32")
            ]),
            ColorCategory(title: "Blues & Purples", colors: [
                ColorInfo(color: "9ACEEB", name: "Cornflower Blue", hex: "9ACEEB"),
                ColorInfo(color: "AFEEEE", name: "Light Turquoise", hex: "AFEEEE"),
                ColorInfo(color: "E6A8D7", name: "Orchid Light", hex: "E6A8D7"),
                ColorInfo(color: "B9AEDC", name: "Wisteria", hex: "B9AEDC")
            ])
        ]

    case "summer":
        return [
            ColorCategory(title: "Neutrals", colors: [
                ColorInfo(color: "F5F5F5", name: "White Smoke", hex: "F5F5F5"),
                ColorInfo(color: "A9A9A9", name: "Cool Gray", hex: "A9A9A9"),
                ColorInfo(color: "C2B280", name: "Sand", hex: "C2B280"),
                ColorInfo(color: "E6E6FA", name: "Light Taupe", hex: "E6E6FA")
            ]),
            ColorCategory(title: "Metallics", colors: [
                ColorInfo(color: "C0C0C0", name: "Silver", hex: "C0C0C0"),
                ColorInfo(color: "E5E4E2", name: "Platinum", hex: "E5E4E2")
            ]),
            ColorCategory(title: "Brights", colors: [
                ColorInfo(color: "FFB6C1", name: "Light Pink", hex: "FFB6C1"),
                ColorInfo(color: "87CEEB", name: "Sky Blue", hex: "87CEEB"),
                ColorInfo(color: "DDA0DD", name: "Plum", hex: "DDA0DD"),
                ColorInfo(color: "9370DB", name: "Medium Purple", hex: "9370DB")
            ]),
            ColorCategory(title: "Pinks & Reds", colors: [
                ColorInfo(color: "FFB6C1", name: "Light Pink", hex: "FFB6C1"),
                ColorInfo(color: "FFE4E1", name: "Misty Rose", hex: "FFE4E1"),
                ColorInfo(color: "FC6C85", name: "Watermelon", hex: "FC6C85"),
                ColorInfo(color: "E30B17", name: "Raspberry", hex: "E30B17")
            ]),
            ColorCategory(title: "Yellows & Oranges", colors: [
                ColorInfo(color: "FFFACD", name: "Light Chiffon", hex: "FFFACD"),
                ColorInfo(color: "FFDAB9", name: "Peach Puff", hex: "FFDAB9")
            ]),
            ColorCategory(title: "Greens", colors: [
                ColorInfo(color: "F0FFF0", name: "Honeydew", hex: "F0FFF0"),
                ColorInfo(color: "F5FFFA", name: "Mint Green", hex: "F5FFFA"),
                ColorInfo(color: "9CAD8A", name: "Sage", hex: "9CAD8A"),
                ColorInfo(color: "20B2AA", name: "Light Sea Green", hex: "20B2AA")
            ]),
            ColorCategory(title: "Blues & Purples", colors: [
                ColorInfo(color: "D8BFD8", name: "Thistle", hex: "D8BFD8"),
                ColorInfo(color: "E6E6FA", name: "Lavender", hex: "E6E6FA"),
                ColorInfo(color: "ADD8E6", name: "Light Blue", hex: "ADD8E6"),
                ColorInfo(color: "B0E0E6", name: "Powder Blue", hex: "B0E0E6")
            ])
        ]

    case "autumn":
        return [
            ColorCategory(title: "Neutrals", colors: [
                ColorInfo(color: "483C32", name: "Taupe", hex: "483C32"),
                ColorInfo(color: "654321", name: "Dark Brown", hex: "654321"),
                ColorInfo(color: "D3D3D3", name: "Light Gray", hex: "D3D3D3"),
                ColorInfo(color: "C19A6B", name: "Camel", hex: "C19A6B")
            ]),
            ColorCategory(title: "Metallics", colors: [
                ColorInfo(color: "FFD700", name: "Gold", hex: "FFD700"),
                ColorInfo(color: "CD7F32", name: "Bronze", hex: "CD7F32")
            ]),
            ColorCategory(title: "Brights", colors: [
                ColorInfo(color: "DC2F02", name: "Vermillion", hex: "DC2F02"),
                ColorInfo(color: "F48C06", name: "Amber", hex: "F48C06"),
                ColorInfo(color: "FFBA08", name: "Selective Yellow", hex: "FFBA08"),
                ColorInfo(color: "B97451", name: "Burnt Sienna", hex: "B97451")
            ]),
            ColorCategory(title: "Pinks & Reds", colors: [
                ColorInfo(color: "6A040F", name: "Deep Burgundy", hex: "6A040F"),
                ColorInfo(color: "D94330", name: "Chili Red", hex: "D94330"),
                ColorInfo(color: "E34819", name: "Tomato", hex: "E34819"),
                ColorInfo(color: "CB4154", name: "Brick Red", hex: "CB4154")
            ]),
            ColorCategory(title: "Yellows & Oranges", colors: [
                ColorInfo(color: "DE8C3C", name: "Autumn", hex: "DE8C3C"),
                ColorInfo(color: "FF7518", name: "Pumpkin", hex: "FF7518"),
                ColorInfo(color: "CC5500", name: "Burnt Orange", hex: "CC5500"),
                ColorInfo(color: "EAA221", name: "Marigold", hex: "EAA221")
            ]),
            ColorCategory(title: "Greens", colors: [
                ColorInfo(color: "808000", name: "Olive", hex: "808000"),
                ColorInfo(color: "8A9A5B", name: "Moss Green", hex: "8A9A5B"),
                ColorInfo(color: "228B22", name: "Forest Green", hex: "228B22"),
                ColorInfo(color: "3B4122", name: "Dark Sage", hex: "3B4122")
            ]),
            ColorCategory(title: "Blues & Purples", colors: [
                ColorInfo(color: "8E458B", name: "Plum", hex: "8E458B"),
                ColorInfo(color: "483D8B", name: "Dark Slate Blue", hex: "483D8B"),
                ColorInfo(color: "614051", name: "Eggplant", hex: "614051"),
                ColorInfo(color: "031730", name: "Deep Navy", hex: "031730")
            ])
        ]

    case "winter":
        return [
            ColorCategory(title: "Neutrals", colors: [
                ColorInfo(color: "FFFAFA", name: "Snow", hex: "FFFAFA"),
                ColorInfo(color: "000000", name: "Black", hex: "000000"),
                ColorInfo(color: "36454F", name: "Charcoal", hex: "36454F"),
                ColorInfo(color: "708090", name: "Slate Gray", hex: "708090")
            ]),
            ColorCategory(title: "Metallics", colors: [
                ColorInfo(color: "C0C0C0", name: "Silver", hex: "C0C0C0"),
                ColorInfo(color: "E5E4E2", name: "Platinum", hex: "E5E4E2")
            ]),
            ColorCategory(title: "Brights", colors: [
                ColorInfo(color: "7DF9FF", name: "Electric Blue", hex: "7DF9FF"),
                ColorInfo(color: "DC143C", name: "Crimson", hex: "DC143C"),
                ColorInfo(color: "FF0000", name: "True Red", hex: "FF0000"),
                ColorInfo(color: "049D49", name: "Emerald", hex: "049D49")
            ]),
            ColorCategory(title: "Pinks & Reds", colors: [
                ColorInfo(color: "C0022B", name: "Cherry Red", hex: "C0022B"),
                ColorInfo(color: "FF00FF", name: "Magenta", hex: "FF00FF"),
                ColorInfo(color: "DC143C", name: "Rosewood", hex: "DC143C"),
                ColorInfo(color: "E30B17", name: "Raspberry", hex: "E30B17")
            ]),
            ColorCategory(title: "Yellows & Oranges", colors: [
                ColorInfo(color: "FFFACD", name: "Light Chiffon", hex: "FFFACD")
            ]),
            ColorCategory(title: "Greens", colors: [
                ColorInfo(color: "355E3B", name: "Hunter Green", hex: "355E3B"),
                ColorInfo(color: "02AB82", name: "Cool Mint", hex: "02AB82"),
                ColorInfo(color: "008080", name: "Teal", hex: "008080"),
                ColorInfo(color: "01796F", name: "Pine Green", hex: "01796F")
            ]),
            ColorCategory(title: "Blues & Purples", colors: [
                ColorInfo(color: "0000FF", name: "Blue", hex: "0000FF"),
                ColorInfo(color: "4B0082", name: "Indigo", hex: "4B0082"),
                ColorInfo(color: "191970", name: "Midnight Blue", hex: "191970"),
                ColorInfo(color: "7851A9", name: "Royal Purple", hex: "7851A9")
            ])
        ]

    default:
        // fallback if result tidak dikenali
        return [
            ColorCategory(title: "General", colors: [
                ColorInfo(color: "CCCCCC", name: "Default Gray", hex: "CCCCCC")
            ])
        ]
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black if invalid
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
