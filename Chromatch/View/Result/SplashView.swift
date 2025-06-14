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
    @State private var progressValue: Float = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Gradient - Spring inspired
                LinearGradient(
                    colors: [
                        Color(red: 0.85, green: 0.95, blue: 0.85),  // Light mint green
                        Color(red: 0.75, green: 0.88, blue: 0.75),  // Medium green
                        Color(red: 0.65, green: 0.80, blue: 0.65)   // Darker green
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Progress Circle
                    ZStack {
                        // Background Circle
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 8)
                            .frame(width: 120, height: 120)
                        
                        // Progress Circle
                        Circle()
                            .trim(from: 0, to: CGFloat(progressValue))
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.blue.opacity(0.8),
                                        Color.purple.opacity(0.6)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(
                                    lineWidth: 8,
                                    lineCap: .round
                                )
                            )
                            .frame(width: 120, height: 120)
                            .rotationEffect(.degrees(-90))
                            .animation(
                                Animation.easeInOut(duration: 2.0),
                                value: progressValue
                            )
                        
                        // Percentage Text
                        Text("\(Int(progressValue * 100))%")
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .scaleEffect(animateProgress ? 1.0 : 0.8)
                    .opacity(animateProgress ? 1.0 : 0.0)
                    .animation(
                        Animation.spring(response: 0.8, dampingFraction: 0.6)
                            .delay(0.3),
                        value: animateProgress
                    )
                    
                    Spacer()
                        .frame(height: 60)
                    
                    // Text Section
                    VStack(spacing: 8) {
                        Text("You are a")
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
            withAnimation(.easeInOut(duration: 0.3)) {
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
    
    private func startAnimations() {
        // Start progress animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateProgress = true
            
            // Animate progress value
            withAnimation(.easeInOut(duration: 2.0)) {
                progressValue = confidence
            }
        }
        
        // Start text animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            animateText = true
        }
    }
}

// Preview
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(
            result: "Spring",
            confidence: 1.0,
            isActive: .constant(true),
            selectedTab: .constant(.home)
        )
    }
}
