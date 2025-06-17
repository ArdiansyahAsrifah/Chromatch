//
//  FirstPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageFirstView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.idleBTEnd)
                .opacity(0.2)

            VStack{
                ProgressBar(currentPage: 0)
                
                Spacer().frame(height: 24)
                
                
                GeometryReader { geometry in
                    VStack(spacing: 8) {
                        Text("Welcome to Chromatch")
                            .font(.custom("Urbanist-Regular", size: 28).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .top)
                        
                        Text("Everyone has natural tones that look best in certain colors. We’re here to help you identify it.")
                            .font(.custom("Urbanist-Regular", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.09, green: 0.02, blue: 0.08))
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
            }
        }
    }
}

#Preview {
    OnboardPageFirstView()
}
