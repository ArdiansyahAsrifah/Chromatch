//
//  Details.swift
//  Chromatch
//
//  Created by Felda Everyl on 13/06/25.
//

//
//  Details.swift
//  Chromatch
//
//  Created by Felda Everyl on 12/06/25.
//

// Custom Button Style for Spring Effect

import SwiftUI
import Foundation

struct SpringButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.5), value: configuration.isPressed)
    }
}

// Extension for custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

func getSeasonalBackground(result: String) -> LinearGradient {
    switch result.lowercased() {
    case "spring":
        return LinearGradient(
            colors: [
                Color(red: 0.85, green: 0.95, blue: 0.85),
                Color(red: 0.75, green: 0.88, blue: 0.75),
                Color(red: 0.65, green: 0.80, blue: 0.65)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    case "summer":
        return LinearGradient(
            colors: [
                Color(red: 0.95, green: 0.85, blue: 0.85),
                Color(red: 0.88, green: 0.75, blue: 0.75),
                Color(red: 0.80, green: 0.65, blue: 0.65)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    case "autumn", "fall":
        return LinearGradient(
            colors: [
                Color(red: 0.95, green: 0.90, blue: 0.80),
                Color(red: 0.90, green: 0.80, blue: 0.70),
                Color(red: 0.85, green: 0.70, blue: 0.60)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    case "winter":
        return LinearGradient(
            colors: [
                Color(red: 0.85, green: 0.90, blue: 0.95),
                Color(red: 0.75, green: 0.80, blue: 0.88),
                Color(red: 0.65, green: 0.70, blue: 0.80)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    default:
        return LinearGradient(
            colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.5)],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

func getSeasonDescription(result: String) -> String {
    switch result.lowercased() {
    case "spring":
        return "Cool, clear, vivid and high contrast"
    case "summer":
        return "Cool, soft, muted and low contrast"
    case "autumn", "fall":
        return "Warm, rich, muted and medium contrast"
    case "winter":
        return "Cool, clear, bright and high contrast"
    default:
        return "Unique color characteristics"
    }
}

func getRecommendedColorsWithNames(result: String) -> [(name: String, color: Color, hex: String)] {
    switch result.lowercased() {
    case "spring":
        return [
            ("Coral Pink", Color(red: 1.0, green: 0.5, blue: 0.31), "#FF7F50"),
            ("Bright Green", Color(red: 0.0, green: 0.8, blue: 0.0), "#00CC00"),
            ("Clear Blue", Color(red: 0.0, green: 0.75, blue: 1.0), "#00BFFF"),
            ("Golden Yellow", Color(red: 1.0, green: 0.84, blue: 0.0), "#FFD700")
        ]
    case "summer":
        return [
            ("Dusty Rose", Color(red: 0.8, green: 0.6, blue: 0.7), "#CC9999"),
            ("Sage Green", Color(red: 0.6, green: 0.7, blue: 0.6), "#9DB39D"),
            ("Powder Blue", Color(red: 0.69, green: 0.88, blue: 0.9), "#B0E0E6"),
            ("Lavender", Color(red: 0.9, green: 0.9, blue: 0.98), "#E6E6FA")
        ]
    case "autumn", "fall":
        return [
            ("Rust Orange", Color(red: 0.72, green: 0.4, blue: 0.16), "#B8621C"),
            ("Olive Green", Color(red: 0.5, green: 0.5, blue: 0.0), "#808000"),
            ("Deep Teal", Color(red: 0.0, green: 0.5, blue: 0.5), "#008080"),
            ("Burgundy", Color(red: 0.5, green: 0.0, blue: 0.13), "#800020")
        ]
    case "winter":
        return [
            ("True Red", Color(red: 1.0, green: 0.0, blue: 0.0), "#FF0000"),
            ("Emerald Green", Color(red: 0.0, green: 0.8, blue: 0.4), "#00CC66"),
            ("Royal Blue", Color(red: 0.25, green: 0.41, blue: 0.88), "#4169E1"),
            ("Pure White", Color(red: 1.0, green: 1.0, blue: 1.0), "#FFFFFF")
        ]
    default:
        return [
            ("Color 1", Color.gray, "#888888"),
            ("Color 2", Color.gray, "#888888"),
            ("Color 3", Color.gray, "#888888"),
            ("Color 4", Color.gray, "#888888")
        ]
    }
}

func getCelebrityNames(result: String) -> [String] {
    switch result.lowercased() {
    case "spring":
        return ["Jessica Chastain", "Taylor Swift", "Emma Stone"]
    case "summer":
        return ["Blake Lively", "Jennifer Aniston", "Reese Witherspoon"]
    case "autumn", "fall":
        return ["Julia Roberts", "Julianne Moore", "Amy Adams"]
    case "winter":
        return ["Anne Hathaway", "Megan Fox", "Zooey Deschanel"]
    default:
        return ["Celebrity 1", "Celebrity 2", "Celebrity 3"]
    }
}

