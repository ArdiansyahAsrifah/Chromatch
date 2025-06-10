//
//  SecondPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageSecondView: View {
    
    //Buat Gridnya
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("What is the\n\(Text("Seasonal Color?").foregroundStyle(Color.red.opacity(0.8)))")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("It's what makes you unique - Your skintone")
                .font(.body)
                .foregroundColor(.secondary)
            
            // Grid 2x2
            LazyVGrid(columns: columns, spacing: 40) {
                SeasonalItemView(imageName: "leaf.fill", seasonName: "Spring", color: .green)
                SeasonalItemView(imageName: "flame.fill", seasonName: "Autumn", color: .orange)
                SeasonalItemView(imageName: "drop.fill", seasonName: "Summer", color: .blue)
                SeasonalItemView(imageName: "snowflake", seasonName: "Winter", color: .cyan)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
