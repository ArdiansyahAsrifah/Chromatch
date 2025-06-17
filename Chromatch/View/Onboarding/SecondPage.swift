//
//  SecondPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageSecondView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.idleBTEnd)
                .opacity(0.2)
            VStack{
                ProgressBar(currentPage: 1)
                
                Spacer().frame(height: 24)
                
                
                
                VStack(spacing: 40) {
                    
                    VStack(spacing: 8) {
                        Text("Discover your season")
                            .font(.custom("Urbanist-Regular", size: 28).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .top)
                        
                        Text("We'll match you to one of four seasonal color palettes based on your unique features.")
                            .font(.custom("Urbanist-Regular", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.top,20)
                    
                    LazyVGrid(columns: columns, spacing: 40) {
                        SeasonalItemView(icon: SpringOnboardIcon(), seasonName: "Spring")
                        SeasonalItemView(icon: SummerOnboardIcon(), seasonName: "Summer")
                        SeasonalItemView(icon: AutumnOnboardIcon(), seasonName: "Autumn")
                        SeasonalItemView(icon: WinterOnboardIcon(), seasonName: "Winter")
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    OnboardPageSecondView()
}
