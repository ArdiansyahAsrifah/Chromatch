//
//  ExpandInfoView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ExpandedColorInfoView: View {
    var colorInfo: ColorInfo
    @Binding var animateElements: Bool
    var index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Color rectangle
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: colorInfo.color))
                .frame(height: 100)
            
            // Color info overlay on the color rectangle
                VStack(alignment: .leading, spacing: 2) {
                    Text(colorInfo.name)
                        .font(.custom("Urbanist-Regular", size: 16).weight(.medium))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)

                    Text(colorInfo.hex)
                        .font(.custom("Urbanist-Regular", size: 14).weight(.medium)) //Nunito
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.clear,
                                Color.black.opacity(0.4)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            )
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: colorInfo.color))
        )
        .scaleEffect(animateElements ? 1.0 : 0.9)
        .opacity(animateElements ? 1.0 : 0.0)
        .animation(
            Animation.spring(response: 0.6, dampingFraction: 0.8)
                .delay(0.3 + Double(index) * 0.05),
            value: animateElements
        )
    }
}
