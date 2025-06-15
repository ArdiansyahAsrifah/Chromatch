//
//  HistoryItemView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct CompactHistoryItemView: View {
    let result: ColorResult
    let onDelete: () -> Void
    
    var seasonColor: Color {
        switch result.result.lowercased() {
        case "spring":
            return Color.green
        case "summer":
            return Color.blue
        case "autumn", "fall":
            return Color.orange
        case "winter":
            return Color.purple
        default:
            return Color.gray
        }
    }
    
    var seasonIcon: String {
        switch result.result.lowercased() {
        case "spring":
            return "leaf.fill"
        case "summer":
            return "sun.max.fill"
        case "autumn", "fall":
            return "leaf.fill"
        case "winter":
            return "snowflake"
        default:
            return "circle.fill"
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            // Profile Image Placeholder + Season Icon
            ZStack {
                // Profile circle (placeholder)
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                    )
                
                // Season icon overlay
                Circle()
                    .fill(seasonColor)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Image(systemName: seasonIcon)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                    )
                    .offset(x: 18, y: -18)
            }
            
            // Result Info
            VStack(alignment: .leading, spacing: 2) {
                Text(result.result)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(formatDate(result.timestamp))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Season Icon (Large)
            Image(systemName: seasonIcon)
                .font(.system(size: 24))
                .foregroundColor(seasonColor)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .contentShape(Rectangle())
        .contextMenu {
            Button(role: .destructive) {
                onDelete()
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}

