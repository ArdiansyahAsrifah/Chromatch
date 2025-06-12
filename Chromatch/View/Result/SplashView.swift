//
//  SplashView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

import SwiftUI

struct SplashView: View {
    var result: String
    var confidence: Float

    @Binding var isActive: Bool
    @Binding var selectedTab: Int

    @State private var goToDetail = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Hasil Prediksi")
                .font(.largeTitle)
                .bold()

            Text(result)
                .font(.title)
                .foregroundColor(.blue)

            Text(String(format: "Confidence: %.2f%%", confidence * 100))
                .foregroundColor(.gray)

            Button("Lihat Detail") {
                goToDetail = true
            }
            .buttonStyle(.borderedProminent)

            Button("Kembali ke Kamera") {
                isActive = false
            }
        }
        .padding()
        .background(
            NavigationLink(
                destination: ResultDetailView(result: result, confidence: confidence, isActive: $isActive, selectedTab: $selectedTab),
                isActive: $goToDetail
            ) {
                EmptyView()
            }
        )
    }
}
