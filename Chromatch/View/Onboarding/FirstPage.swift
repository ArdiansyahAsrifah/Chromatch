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
            
        
                Text("Welcome to your personal color journey!\n\nWe’re here to help identify the seasonal color palette that most likely suits you best.")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .foregroundColor(.black)
                    .opacity(0.9)
                    .padding(.horizontal, 30)
                    .padding(.top, 400)
                    .multilineTextAlignment(.center)
           
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    OnboardPageFirstView()
}
