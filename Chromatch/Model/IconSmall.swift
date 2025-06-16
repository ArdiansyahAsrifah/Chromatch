//
//  IconSmall.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

// MARK: - Onboard Seasonal Icons (smaller versions)

struct SpringOnboardIcon: View {
    var body: some View {
        ZStack {
            // Four leaf petals arranged in a cross pattern
            ForEach(0..<4, id: \.self) { index in
                Ellipse()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.7, green: 0.85, blue: 0.6),  // Light green
                                Color(red: 0.4, green: 0.65, blue: 0.35)  // Darker green
                            ],
                            center: .center,
                            startRadius: 5,
                            endRadius: 25
                        )
                    )
                    .frame(width: 35, height: 60)
                    .rotationEffect(.degrees(Double(index) * 90))
            }
        }
    }
}

struct SummerOnboardIcon: View {
    var body: some View {
        ZStack {
            // Radiating lines
            ForEach(0..<48, id: \.self) { index in
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.4, green: 0.3, blue: 0.8),   // Deep purple
                                Color(red: 0.6, green: 0.5, blue: 0.9).opacity(0.3)  // Light purple
                            ],
                            startPoint: .center,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 20, height: 1)
                    .offset(x: 10)
                    .rotationEffect(.degrees(Double(index) * 7.5))
            }
            
            // Center dark circle
            Circle()
                .fill(Color(red: 0.2, green: 0.1, blue: 0.4))
                .frame(width: 12, height: 12)
        }
    }
}

struct AutumnOnboardIcon: View {
    var body: some View {
        ZStack {
            // Four overlapping circles
            ForEach(0..<4, id: \.self) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.9, green: 0.7, blue: 0.5),   // Light peach
                                Color(red: 0.7, green: 0.5, blue: 0.3)    // Darker brown
                            ],
                            center: .center,
                            startRadius: 8,
                            endRadius: 25
                        )
                    )
                    .frame(width: 45, height: 45)
                    .offset(
                        x: index == 1 || index == 3 ? (index == 1 ? 15 : -15) : 0,
                        y: index == 0 || index == 2 ? (index == 0 ? -15 : 15) : 0
                    )
            }
            
            // Dark center where circles overlap
            Circle()
                .fill(Color(red: 0.3, green: 0.2, blue: 0.1))
                .frame(width: 8, height: 8)
        }
    }
}

struct WinterOnboardIcon: View {
    var body: some View {
        ZStack {
            // 8-pointed star/snowflake
            ForEach(0..<8, id: \.self) { index in
                // Diamond/rhombus shapes
                DiamondShape()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.6, green: 0.7, blue: 0.9),   // Light blue
                                Color(red: 0.3, green: 0.4, blue: 0.7)    // Darker blue
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 25, height: 45)
                    .rotationEffect(.degrees(Double(index) * 45))
            }
            
            // Center white star
            StarShape()
                .fill(Color.white)
                .frame(width: 16, height: 16)
        }
    }
}

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: width/2, y: 0))
        path.addLine(to: CGPoint(x: width, y: height/2))
        path.addLine(to: CGPoint(x: width/2, y: height))
        path.addLine(to: CGPoint(x: 0, y: height/2))
        path.closeSubpath()
        
        return path
    }
}

struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let radius = min(rect.width, rect.height) / 2
        
        for i in 0..<8 {
            let angle = Double(i) * Double.pi / 4
            let point = CGPoint(
                x: center.x + Foundation.cos(angle) * radius,
                y: center.y + Foundation.sin(angle) * radius
            )
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        
        return path
    }
}
