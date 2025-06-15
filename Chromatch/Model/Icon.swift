//
//  Icon.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

// MARK: - Seasonal Icons

struct SpringIcon: View {
    var body: some View {
        ZStack {
            // Leaf petals arranged in a flower pattern
            ForEach(0..<5, id: \.self) { index in
                Ellipse()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.black.opacity(0.3),
                                Color.black.opacity(0.7)
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 60
                        )
                    )
                    .frame(width: 80, height: 140)
                    .rotationEffect(.degrees(Double(index) * 72))
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct SummerIcon: View {
    var body: some View {
        ZStack {
            // Sun rays
            ForEach(0..<24, id: \.self) { index in
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(width: 2, height: 40)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double(index) * 15))
            }
            
            // Center circle
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.black.opacity(0.8),
                            Color.black.opacity(0.4)
                        ],
                        center: .center,
                        startRadius: 5,
                        endRadius: 25
                    )
                )
                .frame(width: 40, height: 40)
        }
        .frame(width: 200, height: 200)
    }
}

struct AutumnIcon: View {
    var body: some View {
        ZStack {
            // Four overlapping circles to create a clover-like shape
            ForEach(0..<4, id: \.self) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.black.opacity(0.3),
                                Color.black.opacity(0.7)
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 50
                        )
                    )
                    .frame(width: 100, height: 100)
                    .offset(
                        x: index == 1 || index == 3 ? (index == 1 ? 30 : -30) : 0,
                        y: index == 0 || index == 2 ? (index == 0 ? -30 : 30) : 0
                    )
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct WinterIcon: View {
    var body: some View {
        ZStack {
            // Snowflake with 8 points
            ForEach(0..<8, id: \.self) { index in
                // Main rays
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(width: 3, height: 80)
                    .rotationEffect(.degrees(Double(index) * 45))
                
                // Diamond shapes at the ends
                Diamond()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.black.opacity(0.4),
                                Color.black.opacity(0.7)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 25, height: 25)
                    .offset(y: -55)
                    .rotationEffect(.degrees(Double(index) * 45))
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct Diamond: Shape {
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

