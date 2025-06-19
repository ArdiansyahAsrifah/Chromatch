//
//  ThirdPage.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct OnboardPageThirdView: View {
    @State private var isActive = false
//    @State var selectedTab: AppTab
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.idleBTEnd)
                    .opacity(0.2)
                
                VStack(alignment: .leading, spacing: 20) {
                    (
                        Text("Ready to unlock the colors that were made for you?\n\nLet's start with ")
                        + Text(" a selfie").bold()
                        
                    )
                    //Subject to Change
                    .font(.custom("Urbanist-Regular", size: 20))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.horizontal, 30)
                    .padding(.top, -80)
                    .multilineTextAlignment(.center)
                    
                    
                    NavigationLink(destination: HomeView(isActive: $isActive, selectedTab: .constant(.home))){
                        ZStack{
                            Circle()
                                .fill(Color.black)
                                .frame(width: 48, height: 48)
                            
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    
                }
            }
        }
        
    }
}


//#Preview {
//    OnboardPageThirdView()
//}

