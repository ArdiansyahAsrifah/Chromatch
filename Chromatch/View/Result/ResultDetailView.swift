//
//  ResultDetailView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

//import SwiftUI
//
//struct ResultDetailView: View {
//    var result: String
//    var confidence: Float
//    
//    @Binding var isActive: Bool
//    @Binding var selectedTab: AppTab
//    
//    @State private var animateElements = false
//    @State private var progressValue: Float = 0.0
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView {
//                VStack(spacing: 0) {
//                    // Background with content
//                    ZStack {
//                        // Background Gradient - Season inspired
//                        getSeasonalBackground(result:result)
//                            .frame(height: 400)
//                        
//                        VStack(spacing: 0) {
//                            // Custom Navigation Bar
//                            HStack {
//                                Button(action: {
//                                    presentationMode.wrappedValue.dismiss()
//                                }) {
//                                    ZStack {
//                                        Circle()
//                                            .fill(Color.white.opacity(0.9))
//                                            .frame(width: 40, height: 40)
//                                        
//                                        Image(systemName: "chevron.left")
//                                            .font(.system(size: 18, weight: .medium))
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                                
//                                Spacer()
//                                
//                                Text("Result")
//                                    .font(.system(size: 18, weight: .semibold))
//                                    .foregroundColor(.black.opacity(0.8))
//                                    .padding(.horizontal, 20)
//                                    .padding(.vertical, 8)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .fill(Color.white.opacity(0.9))
//                                    )
//                                
//                                Spacer()
//                                
//                                // Invisible spacer for balance
//                                Circle()
//                                    .fill(Color.clear)
//                                    .frame(width: 40, height: 40)
//                            }
//                            .padding(.horizontal, 20)
//                            .padding(.top, 10)
//                            
//                            // Header Section with Profile and Progress
//                            HStack {
//                                // Profile Image (placeholder)
//                                ZStack {
//                                    Circle()
//                                        .fill(Color.gray.opacity(0.3))
//                                        .frame(width: 80, height: 80)
//                                    
//                                    Image(systemName: "person.fill")
//                                        .font(.system(size: 35))
//                                        .foregroundColor(.gray.opacity(0.7))
//                                }
//                                .scaleEffect(animateElements ? 1.0 : 0.8)
//                                .opacity(animateElements ? 1.0 : 0.0)
//                                .animation(
//                                    Animation.spring(response: 0.6, dampingFraction: 0.7)
//                                        .delay(0.2),
//                                    value: animateElements
//                                )
//                                
//                                Spacer()
//                                
//                                VStack(alignment: .trailing, spacing: 4) {
//                                    Text("Accuracy")
//                                        .font(.system(size: 12, weight: .medium))
//                                        .foregroundColor(.black.opacity(0.6))
//                                    
//                                    // Progress Circle
//                                    ZStack {
//                                        Circle()
//                                            .stroke(Color.white.opacity(0.3), lineWidth: 6)
//                                            .frame(width: 60, height: 60)
//                                        
//                                        Circle()
//                                            .trim(from: 0, to: CGFloat(progressValue))
//                                            .stroke(
//                                                LinearGradient(
//                                                    colors: [
//                                                        Color.blue.opacity(0.8),
//                                                        Color.purple.opacity(0.6)
//                                                    ],
//                                                    startPoint: .topLeading,
//                                                    endPoint: .bottomTrailing
//                                                ),
//                                                style: StrokeStyle(
//                                                    lineWidth: 6,
//                                                    lineCap: .round
//                                                )
//                                            )
//                                            .frame(width: 60, height: 60)
//                                            .rotationEffect(.degrees(-90))
//                                            .animation(
//                                                Animation.easeInOut(duration: 2.0)
//                                                    .delay(0.5),
//                                                value: progressValue
//                                            )
//                                        
//                                        Text("\(Int(progressValue * 100))%")
//                                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                                            .foregroundColor(.black.opacity(0.8))
//                                    }
//                                }
//                                .scaleEffect(animateElements ? 1.0 : 0.8)
//                                .opacity(animateElements ? 1.0 : 0.0)
//                                .animation(
//                                    Animation.spring(response: 0.6, dampingFraction: 0.7)
//                                        .delay(0.3),
//                                    value: animateElements
//                                )
//                            }
//                            .padding(.horizontal, 30)
//                            .padding(.top, 30)
//                            
//                            // Season Title and Description
//                            VStack(alignment: .leading, spacing: 8) {
//                                HStack {
//                                    Text(result)
//                                        .font(.system(size: 48, weight: .light, design: .default))
//                                        .foregroundColor(.black.opacity(0.9))
//                                        .opacity(animateElements ? 1.0 : 0.0)
//                                        .offset(x: animateElements ? 0 : -30)
//                                        .animation(
//                                            Animation.easeOut(duration: 0.8)
//                                                .delay(0.6),
//                                            value: animateElements
//                                        )
//                                    Spacer()
//                                }
//                                
//                                HStack {
//                                    Text(getSeasonDescription(result:result))
//                                        .font(.system(size: 16, weight: .regular))
//                                        .foregroundColor(.black.opacity(0.7))
//                                        .opacity(animateElements ? 1.0 : 0.0)
//                                        .offset(x: animateElements ? 0 : -30)
//                                        .animation(
//                                            Animation.easeOut(duration: 0.8)
//                                                .delay(0.8),
//                                            value: animateElements
//                                        )
//                                    Spacer()
//                                }
//                            }
//                            .padding(.horizontal, 30)
//                            .padding(.top, 20)
//                            
//                            Spacer()
//                        }
//                    }
//                    
//                    // Content Sections
//                    VStack(spacing: 30) {
//                        // Your Palette Section
//                        VStack(alignment: .leading, spacing: 20) {
//                            HStack {
//                                Text("Your Palette")
//                                    .font(.system(size: 24, weight: .semibold))
//                                    .foregroundColor(.black.opacity(0.9))
//                                
//                                Spacer()
//                                
//                                Button(action: {
//                                    // Action for expand/edit palette
//                                }) {
//                                    Image(systemName: "arrow.up.right")
//                                        .font(.system(size: 16, weight: .medium))
//                                        .foregroundColor(.black.opacity(0.6))
//                                        .padding(8)
//                                        .background(
//                                            Circle()
//                                                .fill(Color.gray.opacity(0.1))
//                                        )
//                                }
//                            }
//                            
//                            // Color Grid (2x2)
//                            VStack(spacing: 12) {
//                                HStack(spacing: 12) {
//                                    ForEach(0..<2) { index in
//                                        let colorInfo = getRecommendedColorsWithNames(result:result)[index]
//                                        VStack(alignment: .leading, spacing: 8) {
//                                            RoundedRectangle(cornerRadius: 15)
//                                                .fill(colorInfo.color)
//                                                .frame(height: 100)
//                                            
//                                            VStack(alignment: .leading, spacing: 2) {
//                                                Text(colorInfo.name)
//                                                    .font(.system(size: 14, weight: .medium))
//                                                    .foregroundColor(.black.opacity(0.8))
//                                                
//                                                Text(colorInfo.hex)
//                                                    .font(.system(size: 12, weight: .regular, design: .monospaced))
//                                                    .foregroundColor(.black.opacity(0.5))
//                                            }
//                                            .padding(.horizontal, 4)
//                                        }
//                                        .scaleEffect(animateElements ? 1.0 : 0.9)
//                                        .opacity(animateElements ? 1.0 : 0.0)
//                                        .animation(
//                                            Animation.spring(response: 0.6, dampingFraction: 0.8)
//                                                .delay(1.0 + Double(index) * 0.1),
//                                            value: animateElements
//                                        )
//                                    }
//                                }
//                                
//                                HStack(spacing: 12) {
//                                    ForEach(2..<4) { index in
//                                        let colorInfo = getRecommendedColorsWithNames(result:result)[index]
//                                        VStack(alignment: .leading, spacing: 8) {
//                                            RoundedRectangle(cornerRadius: 15)
//                                                .fill(colorInfo.color)
//                                                .frame(height: 100)
//                                            
//                                            VStack(alignment: .leading, spacing: 2) {
//                                                Text(colorInfo.name)
//                                                    .font(.system(size: 14, weight: .medium))
//                                                    .foregroundColor(.black.opacity(0.8))
//                                                
//                                                Text(colorInfo.hex)
//                                                    .font(.system(size: 12, weight: .regular, design: .monospaced))
//                                                    .foregroundColor(.black.opacity(0.5))
//                                            }
//                                            .padding(.horizontal, 4)
//                                        }
//                                        .scaleEffect(animateElements ? 1.0 : 0.9)
//                                        .opacity(animateElements ? 1.0 : 0.0)
//                                        .animation(
//                                            Animation.spring(response: 0.6, dampingFraction: 0.8)
//                                                .delay(1.0 + Double(index) * 0.1),
//                                            value: animateElements
//                                        )
//                                    }
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 25)
//                        
//                        // Seasonal Twins Section
//                        VStack(alignment: .leading, spacing: 20) {
//                            HStack {
//                                Text("Seasonal Twins")
//                                    .font(.system(size: 24, weight: .semibold))
//                                    .foregroundColor(.black.opacity(0.9))
//                                Spacer()
//                            }
//                            
//                            HStack(spacing: 20) {
//                                ForEach(0..<3) { index in
//                                    VStack(spacing: 12) {
//                                        // Celebrity photo placeholder
//                                        ZStack {
//                                            Circle()
//                                                .fill(Color.gray.opacity(0.3))
//                                                .frame(width: 80, height: 80)
//                                            
//                                            Image(systemName: "person.fill")
//                                                .font(.system(size: 35))
//                                                .foregroundColor(.gray.opacity(0.7))
//                                        }
//                                        .scaleEffect(animateElements ? 1.0 : 0.8)
//                                        .opacity(animateElements ? 1.0 : 0.0)
//                                        .animation(
//                                            Animation.spring(response: 0.6, dampingFraction: 0.7)
//                                                .delay(1.5 + Double(index) * 0.1),
//                                            value: animateElements
//                                        )
//                                        
//                                        Text(getCelebrityNames(result:result)[index])
//                                            .font(.system(size: 14, weight: .medium))
//                                            .foregroundColor(.black.opacity(0.8))
//                                            .multilineTextAlignment(.center)
//                                            .opacity(animateElements ? 1.0 : 0.0)
//                                            .animation(
//                                                Animation.easeOut(duration: 0.6)
//                                                    .delay(1.6 + Double(index) * 0.1),
//                                                value: animateElements
//                                            )
//                                    }
//                                }
//                                
//                                Spacer()
//                            }
//                        }
//                        .padding(.horizontal, 25)
//                        
//                        // Action Buttons
//                        VStack(spacing: 15) {
//                            // Retry Button
//                            Button(action: {
//                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
//                                    presentationMode.wrappedValue.dismiss()
//                                }
//                            }) {
//                                Text("Try Again")
//                                    .font(.system(size: 18, weight: .semibold))
//                                    .foregroundColor(.black)
//                                    .frame(maxWidth: .infinity)
//                                    .padding(.vertical, 16)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 25)
//                                            .fill(Color.white)
//                                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
//                                    )
//                            }
//                            .buttonStyle(SpringButtonStyle())
//                            
//                            // Save Button
//                            Button(action: {
//                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
//                                    isActive = false
//                                    selectedTab = 1
//                                }
//                            }) {
//                                Text("Save to Profile")
//                                    .font(.system(size: 18, weight: .semibold))
//                                    .foregroundColor(.white)
//                                    .frame(maxWidth: .infinity)
//                                    .padding(.vertical, 16)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 25)
//                                            .fill(Color.black.opacity(0.9))
//                                    )
//                            }
//                            .buttonStyle(SpringButtonStyle())
//                        }
//                        .padding(.horizontal, 25)
//                        .padding(.bottom, 30)
//                    }
//                    .background(Color.white)
//                    .cornerRadius(25, corners: [.topLeft, .topRight])
//                    .offset(y: animateElements ? 0 : 300)
//                    .animation(
//                        Animation.spring(response: 0.8, dampingFraction: 0.8)
//                            .delay(0.4),
//                        value: animateElements
//                    )
//                }
//            }
//        }
//        .navigationBarHidden(true)
//        .onAppear {
//            startAnimations()
//        }
//    }
//    
//    private func startAnimations() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            animateElements = true
//            
//            // Animate progress value
//            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
//                progressValue = confidence
//            }
//        }
//    }
//}
//   
//// Preview
//struct ResultDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultDetailView(
//            result: "Spring",
//            confidence: 1.0,
//            isActive: .constant(true),
//            selectedTab: .constant(.home)
//        )
//    }
//}
