//
//  ResultDetailView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

import SwiftUI

struct ResultDetailView: View {
    var result: String
    var confidence: Float

    @Binding var isActive: Bool
    @Binding var selectedTab: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Warna")
                .font(.title)
                .bold()

            Text("Warna Musim: \(result)")
            Text(String(format: "Kepercayaan: %.2f%%", confidence * 100))

            Button("Simpan") {
                isActive = false
                selectedTab = 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
