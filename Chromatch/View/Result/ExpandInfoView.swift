//
//  ExpandInfoView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ExpandedColorInfoView: View {
    var colorInfo: ColorInfo
    var index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
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
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: colorInfo.color))
                .frame(height:70)
        )
        .padding(.bottom, 16)
    }
}
