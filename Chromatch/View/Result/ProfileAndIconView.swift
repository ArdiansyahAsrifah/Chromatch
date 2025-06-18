//
//  ProfileProgressView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ProfileAndIconView: View {
    @Binding var progressValue: Float
    var confidence: Float
    var result: String
    let imageData: Data?

    var body: some View {
        HStack(alignment: .top) {
            // Profile Image aligned to top
            ProfileImageView(imageData: imageData)

            Spacer()
            
            // Seasonal icon aligned to top
            getSeasonalIcon(result: result)
        }
        .padding(.top, 10)
    }
}

