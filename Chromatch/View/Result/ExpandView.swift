//
//  ExpandView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ExpandedColorView: View {
    var result: String
    
    private var colorCategories: [ColorCategory] {
        return getColorCategories(for: result)
    }

    var body: some View {
        LazyVStack(spacing: 20) {
            ForEach(Array(colorCategories.enumerated()), id: \.offset) { index, category in
                ColorCategorySection(category: category, categoryIndex: index)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}
