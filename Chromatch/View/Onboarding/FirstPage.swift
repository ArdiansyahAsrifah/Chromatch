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
            
            Image("ChromatchLogoOnboarding")
                .frame(width: 560, height: 560)
                .position(x:196.5, y:572)
           
            VStack{
                
                GeometryReader { geometry in
                    VStack(spacing: 8) {
                        HStack{
                            Text("Welcome to Chromatch")
                                .font(.custom("Urbanist-Regular", size: 28).weight(.semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)

                            
                        }.frame(width: 361, height: 34)
                       
                        
                        HStack {
                            Text("Everyone has natural tones that look best in certain colors. We’re here to help you identify it.")
                                .font(.custom("Urbanist-Regular", size: 20))    
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.09, green: 0.02, blue: 0.08))
                                
                        }
                        .frame(width: 361, height: 72)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                
//                Spacer()
//                
//                ProgressBar(currentPage: 0)
            }
        }
    }
}

#Preview {
    OnboardPageFirstView()
}
