//
//  PalleteSection.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct YourPaletteSection: View {
    var result: String
    @Binding var animateElements: Bool
    @Binding var showExpandedPalette: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Your Palette")
                        .font(.custom("Urbanist-Regular", size: 20)
                        .weight(.medium))
                        .foregroundColor(.black.opacity(0.9))
                    
                    if showExpandedPalette {
                        Text("Colors that flatter your tone")
                            .font(.custom("Urbanist-Regular", size: 12).weight(.light)) //Nunito
                            .foregroundColor(.black.opacity(0.6))
                    }
                }

                Spacer()

                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        showExpandedPalette.toggle()
                    }
                }) {
                    Image(systemName: showExpandedPalette ? "xmark" : "arrow.up.right")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black.opacity(0.6))
                        .padding(10)
                        .background(
                            Circle()
                                .fill(Color.black.opacity(0.08))
                        )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 16)
            
            // Color content
            if showExpandedPalette {
                ExpandedColorView(result: result, animateElements: $animateElements)
            } else {
                ColorGridView(result: result, animateElements: $animateElements)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.05))
        )
        .scaleEffect(animateElements ? 1.0 : 0.95)
        .opacity(animateElements ? 1.0 : 0.0)
        .animation(
            Animation.spring(response: 0.7, dampingFraction: 0.8)
                .delay(0.8),
            value: animateElements
        )
    }
}
