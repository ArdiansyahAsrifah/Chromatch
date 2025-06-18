//
//  CelebrityView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct CelebrityView: View {
    var result: String
    var index: Int

    var body: some View {
        VStack(spacing: 12) {
            // Celebrity photo placeholder
            ZStack {

                Image(getCelebrityImage(result: result)[index])
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .foregroundColor(.gray.opacity(0.7))
            }

            // Celebrity name
            Text(getCelebrityNames(result: result)[index])
                .font(.custom("Urbanist-Regular", size: 12)) //Nunito
                .foregroundColor(.black.opacity(0.8))
                .multilineTextAlignment(.center)
                .lineLimit(2)

        }
        .frame(maxWidth: .infinity)
    }
}


