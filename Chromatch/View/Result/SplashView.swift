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

    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab

    @State private var goToDetail = false
    @State private var animateProgress = false
    @State private var animateText = false
    @State private var animateIcon = false
    @State private var progressValue: Float = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Dynamic Background based on result
                getBackgroundGradient()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Seasonal Icon
                    getSeasonalIcon()
                        .scaleEffect(animateIcon ? 1.0 : 0.8)
                        .opacity(animateIcon ? 1.0 : 0.0)
                        .animation(
                            Animation.spring(response: 0.8, dampingFraction: 0.6)
                                .delay(0.5),
                            value: animateIcon
                        )
                    
                    Spacer()
                        .frame(height: 80)
                    
                    // Text Section
                    VStack(spacing: 8) {
                        Text("You're most likely a")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.black.opacity(0.7))
                            .opacity(animateText ? 1.0 : 0.0)
                            .offset(y: animateText ? 0 : 20)
                            .animation(
                                Animation.easeOut(duration: 0.8)
                                    .delay(1.5),
                                value: animateText
                            )
                        
                        Text(result)
                            .font(.system(size: 48, weight: .light, design: .default))
                            .foregroundColor(.black.opacity(0.9))
                            .opacity(animateText ? 1.0 : 0.0)
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
        .onAppear {
            startAnimations()
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                goToDetail = true
            }
        }
        .background(
            NavigationLink(
                destination: ResultDetailView(
                    result: result,
                    confidence: confidence,
                    isActive: $isActive,
                    selectedTab: $selectedTab
                ),
                isActive: $goToDetail
            ) {
                EmptyView()
            }
        )
    }
    
    func getBackgroundGradient() -> LinearGradient {
        switch result.lowercased() {
        case "spring":
            return LinearGradient(
                colors: [
                    Color(red: 0.92, green: 0.96, blue: 0.88),  // Light mint
                    Color(red: 0.85, green: 0.93, blue: 0.82),  // Medium mint
                    Color(red: 0.78, green: 0.90, blue: 0.76)   // Darker mint
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        case "summer":
            return LinearGradient(
                colors: [
                    Color(red: 0.94, green: 0.92, blue: 0.98),  // Light lavender
                    Color(red: 0.88, green: 0.84, blue: 0.95),  // Medium lavender
                    Color(red: 0.82, green: 0.76, blue: 0.92)   // Darker lavender
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        case "autumn":
            return LinearGradient(
                colors: [
                    Color(red: 0.98, green: 0.94, blue: 0.88),  // Light peach
                    Color(red: 0.95, green: 0.88, blue: 0.78),  // Medium peach
                    Color(red: 0.92, green: 0.82, blue: 0.68)   // Darker peach
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        case "winter":
            return LinearGradient(
                colors: [
                    Color(red: 0.92, green: 0.94, blue: 0.96),  // Light blue-gray
                    Color(red: 0.85, green: 0.88, blue: 0.92),  // Medium blue-gray
                    Color(red: 0.78, green: 0.82, blue: 0.88)   // Darker blue-gray
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        default:
            return LinearGradient(
                colors: [
                    Color(red: 0.85, green: 0.95, blue: 0.85),
                    Color(red: 0.75, green: 0.88, blue: 0.75),
                    Color(red: 0.65, green: 0.80, blue: 0.65)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
    
    @ViewBuilder
    func getSeasonalIcon() -> some View {
        switch result.lowercased() {
        case "spring":
            SpringIcon()
        case "summer":
            SummerIcon()
        case "autumn":
            AutumnIcon()
        case "winter":
            WinterIcon()
        default:
            SpringIcon()
        }
    }
    
    private func startAnimations() {
        // Start icon animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateIcon = true
        }
        
        // Start text animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            animateText = true
        }
    }
}


// Preview
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView(
                result: "Spring",
                confidence: 1.0,
                isActive: .constant(true),
                selectedTab: .constant(.home)
            )
            
            SplashView(
                result: "Summer",
                confidence: 0.85,
                isActive: .constant(true),
                selectedTab: .constant(.home)
            )
            
            SplashView(
                result: "Autumn",
                confidence: 0.92,
                isActive: .constant(true),
                selectedTab: .constant(.home)
            )
            
            SplashView(
                result: "Winter",
                confidence: 0.78,
                isActive: .constant(true),
                selectedTab: .constant(.home)
            )
        }
    }
}

