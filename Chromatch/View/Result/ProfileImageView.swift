//
//  ProfileImageView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct ProfileImageView: View {
    @Binding var animateElements: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 70, height: 70)
            
            Image(systemName: "person.fill")
                .font(.system(size: 35))
                .foregroundColor(.gray.opacity(0.7))
        }
        .scaleEffect(animateElements ? 1.0 : 0.8)
        .opacity(animateElements ? 1.0 : 0.0)
        .animation(
            Animation.spring(response: 0.6, dampingFraction: 0.7)
                .delay(0.2),
            value: animateElements
        )
    }
}

