//
//  CelebrityView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct CelebrityView: View {
    var result: String
    var index: Int
    @Binding var animateElements: Bool

    var body: some View {
        VStack(spacing: 12) {
            // Celebrity photo placeholder
            ZStack {

                Image(getCelebrityImage(result: result)[index])
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .foregroundColor(.gray.opacity(0.7))
            }
            .scaleEffect(animateElements ? 1.0 : 0.8)
            .opacity(animateElements ? 1.0 : 0.0)
            .animation(
                Animation.spring(response: 0.6, dampingFraction: 0.7)
                    .delay(1.5 + Double(index) * 0.1),
                value: animateElements
            )

            // Celebrity name
            Text(getCelebrityNames(result: result)[index])
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black.opacity(0.8))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .opacity(animateElements ? 1.0 : 0.0)
                .animation(
                    Animation.easeOut(duration: 0.6)
                        .delay(1.6 + Double(index) * 0.1),
                    value: animateElements
                )
        }
        .frame(maxWidth: .infinity)
    }
}


