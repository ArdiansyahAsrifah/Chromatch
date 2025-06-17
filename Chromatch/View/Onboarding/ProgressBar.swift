//
//  ProgressBar.swift
//  Chromatch
//
//  Created by Felda Everyl on 16/06/25.
//

import SwiftUI

struct ProgressBar: View {
    let currentPage: Int  // 0-based index

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<2, id: \.self) { index in
                Capsule()
                    .frame(width:110, height: 2)
                    .foregroundColor(index <= currentPage ? .black : .gray.opacity(0.3))
                    .animation(.easeInOut(duration: 0.2), value: currentPage)
            }
        }
        .padding(.horizontal, 60)
        .padding(.top,26)
        .multilineTextAlignment(.center)
    }
}
