//
//  ThirdPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageThirdView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.idleBTEnd)
                .opacity(0.2)
            
            VStack(alignment: .leading, spacing: 20) {
                (
                    Text("Ready to unlock the colors that were made for you?\n\nLet's start with a ")
                    + Text("selfie").bold()
                    
                    )
                //Subject to Change
                  .font(.custom("Urbanist-Regular", size: 20))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, alignment: .top)
                  .padding(.horizontal, 30)
                  .padding(.top, -80)
                  .multilineTextAlignment(.center)
                
            }
            
        }
    }
}


#Preview {
    OnboardPageThirdView()
}

