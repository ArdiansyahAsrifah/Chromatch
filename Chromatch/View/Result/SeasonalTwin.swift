//
//  SeasonalTwin.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonalTwinsSection: View {
    var result: String
    @Binding var animateElements: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            HStack {
                Text("Seasonal Twins")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black.opacity(0.9))
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 16)

            // Celebrity grid
            HStack(spacing: 20) {
                ForEach(0..<3) { index in
                    CelebrityView(result: result, index: index, animateElements: $animateElements)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.05))
        )
        .scaleEffect(animateElements ? 1.0 : 0.95)
        .opacity(animateElements ? 1.0 : 0.0)
        .animation(
            Animation.spring(response: 0.7, dampingFraction: 0.8)
                .delay(1.2),
            value: animateElements
        )
    }
}
