//
//  ColorInfoView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

struct ColorInfoView: View {
    var colorInfo: ColorInfo
    var index: Int

    var body: some View {
        let bgColor = Color(hex: colorInfo.color)
        let textColor = bgColor.isLight() ? Color.black : Color.white

        return VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 2) {
                Text(colorInfo.name)
                    .font(.custom("Urbanist-Regular", size: 16).weight(.medium))
                    .foregroundColor(textColor)
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)

                Text(colorInfo.hex)
                    .font(.custom("Urbanist-Regular", size: 14).weight(.medium))
                    .foregroundColor(textColor.opacity(0.9))
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(bgColor)
                    .frame(height: 70)
            )
            .padding(.bottom, 16)
        }
    }
}

import SwiftUI

extension Color {
    func isLight(threshold: Double = 0.6) -> Bool {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)

        // Perceived brightness calculation
        let brightness = (red * 299 + green * 587 + blue * 114) / 1000
        return brightness > threshold
    }
}


