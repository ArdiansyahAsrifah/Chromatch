//
//  SplashView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

// SplashView.swift

// SplashView.swift

import SwiftUI

struct SplashView: View {
    let result: String
    let confidence: Float

    @State private var goToResultDetail = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("You are a")
                    .font(.title)
                    .foregroundColor(.white)

                Text(result)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Confidence: \(Int(confidence * 100))%")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
            }
        }
        .onAppear {

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                goToResultDetail = true
            }
        }
        .fullScreenCover(isPresented: $goToResultDetail) {
            ResultDetailView(result: result, confidence: confidence)
        }
    }
}
