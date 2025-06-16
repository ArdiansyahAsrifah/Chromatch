//
//  ProfileProgressView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ProfileAndProgressView: View {
    @Binding var animateElements: Bool
    @Binding var progressValue: Float
    var confidence: Float
    
    var body: some View {
        HStack {
            ProfileImageView(animateElements: $animateElements)
            
            Spacer()
            

        }
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}
