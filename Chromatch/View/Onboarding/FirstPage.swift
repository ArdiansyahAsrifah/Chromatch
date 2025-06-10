//
//  FirstPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageFirstView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Gabungin Dua Teks dengan Gradient
            (
                Text("Welcome to ")
                +
                Text("Chromatch!")
                // Style khusus (gradien) kata terakhir
                    .foregroundStyle(
                        LinearGradient(colors: [.idleBTStart, .idleBTEnd], startPoint: .leading, endPoint: .trailing)
                    )
            )
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, -30)
            
            Text("A place to discover your seasonal color")
                .font(.body)
                .foregroundColor(.secondary)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.pink.opacity(0.8))
                .frame(width: 250, height: 250)
                .padding(.vertical, 40)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}
