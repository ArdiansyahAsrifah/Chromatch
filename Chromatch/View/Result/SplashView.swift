//
//  SplashView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

import SwiftUI

struct SplashView: View {
    var result: String
    var confidence: Float

    @Binding var selectedTab: AppTab

    @State private var goToDetail = false
    @State private var animateProgress = false
    @State private var animateText = false
    @State private var animateIcon = false
    @State private var progressValue: Float = 0.0
    let imageData: Data?
    
    var onRetry: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Dynamic Background based on result
                getBackgroundGradient(result:result)
                    .frame(width: 400)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {

                    // Seasonal Icon
                    getSeasonalIcon()
                        .scaleEffect(animateIcon ? 1.0 : 0.8)
                        .opacity(animateIcon ? 1.0 : 0.0)
                        .animation(
                            Animation.spring(response: 0.8, dampingFraction: 0.6)
                                .delay(0.5),
                            value: animateIcon
                        )
                    
                        .padding(.top,100)
                        .padding(.bottom,16)
                    
                    // Text Section
                    VStack(spacing: 8) {
                        (Text("You're ") + Text("most likely").underline() + Text(" a"))
                            .font(.custom("Urbanist-Regular", size: 16))
                            .foregroundColor(.black.opacity(0.7))
                            .opacity(animateText ? 0.5 : 0.0)
                            .offset(y: animateText ? 0 : 20)
                            .animation(
                                Animation.easeOut(duration: 0.8)
                                    .delay(1.5),
                                value: animateText
                            )
                        
                        Text(result)
                            .font(.custom("Urbanist-Regular", size: 48).weight(.medium))
                            .foregroundColor(.black.opacity(0.9))
                            .opacity(animateText ? 0.5 : 0.0)
                            .offset(y: animateText ? 0 : 30)
                            .animation(
                                Animation.easeOut(duration: 0.8)
                                    .delay(1.8),
                                value: animateText
                            )
                    }
                    
                    Spacer()
                    
                    // Hidden Detail Button (tap anywhere to navigate)
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            goToDetail = true
                        }
                    }) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: geometry.size.width, height: 100)
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            // A check to prevent this from running if navigation has already started
            if !self.goToDetail {
                self.goToDetail = true
            }
        }
        .onAppear {
            startAnimations()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                if !self.goToDetail {
                    self.goToDetail = true
                }
            }
        }
        .background(
            NavigationLink(
                destination: ResultDetailView(
                    result: result,
                    confidence: confidence,
                    selectedTab: $selectedTab,
                    imageData: imageData,
                    onRetry: onRetry
                ),
                isActive: $goToDetail
            ) {
                EmptyView()
            }
        )
    }
    
    func getBackgroundGradient(result:String) -> some View{
        switch result.lowercased() {
        case "spring":
            return Image("Spring-BG")

        case "summer":
            return Image("Summer-BG")
            
        case "autumn", "fall":
            return Image("Autumn-BG")
            
        case "winter":
            return Image("Winter-BG")
            
        default:
            return Image("Default-BG")
        }
    }
    
    @ViewBuilder
    func getSeasonalIcon() -> some View {
        switch result.lowercased() {
        case "spring":
            Image("Spring-S")
        case "summer":
            Image("Summer-S")
        case "autumn":
            Image("Autumn-S")
        case "winter":
            Image("Winter-S")
        default:
            Image("Spring-S")
        }
    }
    
    private func startAnimations() {
        // Start icon animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateIcon = true
        }
        
        // Start text animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animateText = true
        }
    }
}


//// Preview
//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SplashView(
//                result: "Spring",
//                confidence: 1.0,
//                isActive: .constant(true),
//                selectedTab: .constant(.home),
//                image: Image("spring")
//            )
//
//            SplashView(
//                result: "Summer",
//                confidence: 0.85,
//                isActive: .constant(true),
//                selectedTab: .constant(.home),
//                image: Image("summer")
//            )
//
//            SplashView(
//                result: "Autumn",
//                confidence: 0.92,
//                isActive: .constant(true),
//                selectedTab: .constant(.home)
//            )
//
//            SplashView(
//                result: "Winter",
//                confidence: 0.78,
//                isActive: .constant(true),
//                selectedTab: .constant(.home)
//            )
//        }
//    }
//}
