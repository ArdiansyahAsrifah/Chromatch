//
//  SeasonDesc.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonTitleAndDescriptionView: View {
    var result: String
    @Binding var animateElements: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(result)
                    .font(.system(size: 48, weight: .regular, design: .rounded))
                    .foregroundColor(.black.opacity(0.9))
                    .opacity(animateElements ? 1.0 : 0.0)
                    .offset(x: animateElements ? 0 : -30)
                    .animation(
                        Animation.easeOut(duration: 0.8)
                            .delay(0.6),
                        value: animateElements
                    )
                //                Spacer()
            }
            
            HStack {
                Text(getSeasonDescription(result: result))
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.black.opacity(0.7))
                    .opacity(animateElements ? 1.0 : 0.0)
                    .offset(x: animateElements ? 0 : -30)
                    .animation(
                        Animation.easeOut(duration: 0.8)
                            .delay(0.8),
                        value: animateElements
                    )
                Spacer()
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
}
