//
//  ColorGridView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ColorGridView: View {
    var result: String
    @Binding var animateElements: Bool

    var body: some View {
        VStack(spacing: 12) {
            ForEach(0..<2) { rowIndex in
                HStack(spacing: 12) {
                    ForEach(0..<2) { columnIndex in
                        let index = rowIndex * 2 + columnIndex
                        let colorTuple = getRecommendedColorsWithNames(result: result)[index]
                        let colorInfo = ColorInfo(color: colorTuple.color, name: colorTuple.name, hex: colorTuple.hex)
                        ColorInfoView(colorInfo: colorInfo, animateElements: $animateElements, index: index)
                    }
                }
            }
        }
    }
}
