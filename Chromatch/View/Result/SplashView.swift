//
//  SplashView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .padding(10)
                    .shadow(radius: 20)
                
                Text("You are a")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .medium, design: .default))
                
                Text("True Summer")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .italic()
            }
            .padding(.top, -150)
        }
        
        
        
    }
}

#Preview {
    SplashView()
}
