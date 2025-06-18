//
//  MonthSectionView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.


import SwiftUI

struct MonthSectionView: View {
    let monthName: String
    let results: [ColorResult]
    let onDelete: (ColorResult) -> Void
    var onSelect: (ColorResult) -> Void 

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(monthName)
                    .font(.custom("Urbanist-Regular", size: 24).weight(.medium))
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.horizontal, 4)

            VStack(spacing: 0) {
                ForEach(Array(results.enumerated()), id: \.element.id) { index, result in
                    CompactHistoryItemView(
                        result: result,
                        onDelete: { onDelete(result) }
                    )
                    .onTapGesture {
                        onSelect(result)  
                    }
                    .buttonStyle(PlainButtonStyle())

                    if index < results.count - 1 {
                        Divider()
                            .padding(.leading, 68)
                    }
                }

            }
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
            .opacity(0.8)
        }
    }
}
