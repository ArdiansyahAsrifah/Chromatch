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

func getSeasonalBackground(result: String) -> some View {
    switch result.lowercased() {
    case "spring":
        return Image("SpringBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
    case "summer":
        return Image("SummerBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
    case "autumn", "fall":
        return Image("AutumnBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
    case "winter":
        return Image("WinterBG")
          
            .resizable()
            .aspectRatio(contentMode: .fill)
    default:
        return Image("BlankBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

func getSeasonalLogo(result: String) -> Image {
    switch result.lowercased() {
    case "spring":
        return Image("SpringLogo")
    case "summer":
        return Image("SummerLogo")
    case "autumn", "fall":
        return Image("AutumnLogo")
    case "winter":
        return Image("WinterLogo")
    default:
        return Image("")
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
        return ["Brad P.", "Cameron D.", "Hayden P."]
    case "summer":
        return ["Matt B.", "Yael S.", "Alison B."]
    case "autumn", "fall":
        return ["Tsutsumi H.", "Beyonce", "Martin F."]
    case "winter":
        return ["Hilary R.", "Jason S.", "Marion C."]
    default:
        return ["Celebrity 1", "Celebrity 2", "Celebrity 3"]
    }
}

func getCelebrityImage(result: String) -> [String] {
    switch result.lowercased() {
    case "spring":
        return ["brad", "cameron", "hayden"]
    case "summer":
        return ["matt", "alisson", "yael"]
    case "autumn", "fall":
        return ["tsusumi", "beyonce", "martin"]
    case "winter":
        return ["hilary", "jason", "marion"]
    default:
        return ["person.fill", "person.fill", "person.fill"]
    }
}

