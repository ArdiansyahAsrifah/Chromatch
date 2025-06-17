//
//  SeasonalItemView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonalItemView: View {
    let image: String
    let seasonName: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 96, height: 96)
            
            Text(seasonName)
                .font(.custom("Urbanist-Regular", size: 24).weight(.medium))
                .foregroundColor(.black.opacity(0.8))
        }
    }
}
