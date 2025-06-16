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
            
            VStack(spacing: 40) {
                
                Spacer()
            
                LazyVGrid(columns: columns, spacing: 40) {
                    SeasonalItemView(icon: SpringOnboardIcon(), seasonName: "Spring")
                    SeasonalItemView(icon: SummerOnboardIcon(), seasonName: "Summer")
                    SeasonalItemView(icon: AutumnOnboardIcon(), seasonName: "Autumn")
                    SeasonalItemView(icon: WinterOnboardIcon(), seasonName: "Winter")
                }
                
                VStack(spacing: 16) {
                    Text("Everyone has natural tones that look best\nin certain colors.")
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                    
                    Text("We group them into \(Text("4 palettes").fontWeight(.semibold)).")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    OnboardPageSecondView()
}
