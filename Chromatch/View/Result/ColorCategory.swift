//
//  ColorCategory.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ColorCategorySection: View {
    var category: ColorCategory
    @Binding var animateElements: Bool
    var categoryIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(category.title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black.opacity(0.9))
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 2), spacing: 12) {
                ForEach(Array(category.colors.enumerated()), id: \.offset) { colorIndex, colorInfo in
                    ExpandedColorInfoView(
                        colorInfo: colorInfo,
                        animateElements: $animateElements,
                        index: categoryIndex * 4 + colorIndex
                    )
                }
            }
        }
    }
}
