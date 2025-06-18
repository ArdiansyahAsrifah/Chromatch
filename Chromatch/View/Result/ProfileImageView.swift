//
//  ProfileImageView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//


import SwiftUI

struct ProfileImageView: View {
    let imageData: Data?
    
    var body: some View {
        ZStack {
            
            if let imageData = imageData,
               let uiImage = UIImage(data: imageData) {
                // Display the captured photo
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
            } else {
                // Fallback to default person icon
                Image(systemName: "person.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.gray.opacity(0.7))
            }
        }

    }
}
