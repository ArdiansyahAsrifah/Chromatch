//
//  ThirdPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageThirdView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Let's find Yours!")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("Scan your face now to find out")
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

