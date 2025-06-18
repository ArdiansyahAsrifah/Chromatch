// HeaderView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 12/06/25.

import SwiftUI

struct HeaderView: View {
    var result: String
    @Binding var progressValue: Float
    var confidence: Float
    let imageData: Data?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                ProfileAndIconView(progressValue: $progressValue, confidence: confidence, result: result, imageData: imageData)
                    .padding(.top,55)
                
                SeasonTitleAndDescriptionView(result: result)
                    .padding(.bottom,20)
                
                Text("Tips : You shine in bold, high contrast colors.")
                    .font(.custom("Urbanist-Regular", size: 14))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    .background(Color(red: 58/255, green: 66/255, blue: 110/255))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 2)
                    .padding(.bottom, 8)

            }
            .padding(.horizontal, 24)

                

            
        }
    }
}

