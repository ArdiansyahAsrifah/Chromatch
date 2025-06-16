//
//  SeasonalItemView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonalItemView<Content: View>: View {
    let icon: Content
    let seasonName: String
    
    var body: some View {
        VStack(spacing: 12) {
            icon
                .frame(width: 80, height: 80)
            
            Text(seasonName)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black.opacity(0.8))
        }
    }
}
