//
//  SeasonalTwin.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonalTwinsSection: View {
    var result: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            HStack {
                Text("Seasonal Twins")
                    .font(.custom("Urbanist-Regular", size: 20).weight(.medium))
                    .foregroundColor(.black.opacity(0.9))
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            
            // Celebrity grid
            HStack(spacing: 20) {
                ForEach(0..<3) { index in
                    CelebrityView(result: result, index: index)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.5))
        )
    }
}
