//
//  ResultDetailView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//
import SwiftUI

struct ResultDetailView: View {
    let result: String
    let confidence: Float

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Result")
                .font(.largeTitle)
                .bold()

            Text("Result: \(result)")
            Text("Confidence: \(Int(confidence * 100))%")
        }
        .padding()
    }
}
