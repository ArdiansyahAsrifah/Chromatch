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
    let imageData: Data?
    
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
                    
                        .padding(.top,150)
                        .padding(.bottom,16)
                    
                    // Text Section
                    VStack(spacing: 8) {
                        switch result.lowercased(){
                            case "spring":
                            return AnyView((Text("Your skin has ") + Text("warm undertones").underline() + Text(" with ")
                                            + Text("light, clear").underline() + Text(" features. ")
                                            + Text("You're most likely a").fontWeight(.semibold))
                                           
                                .font(.custom("Urbanist-Regular", size: 16))
                                .foregroundColor(.black.opacity(0.7))
                                .opacity(animateText ? 1.0 : 0.0)
                                .offset(y: animateText ? 0 : 20)
                                .animation(
                                    Animation.easeOut(duration: 0.8)
                                        .delay(1.5),
                                    value: animateText
                                ))
                            
                            case "summer":
                            return AnyView((Text("Your skin has ") + Text("cool undertones").underline() + Text(" with ")
                                            + Text("soft, muted").underline() + Text("features.")
                                            + Text(" You're most likely a").fontWeight(.semibold))
                                .font(.custom("Urbanist-Regular", size: 16))
                                .foregroundColor(.black.opacity(0.7))
                                .opacity(animateText ? 1.0 : 0.0)
                                .offset(y: animateText ? 0 : 20)
                                .animation(
                                    Animation.easeOut(duration: 0.8)
                                        .delay(1.5),
                                    value: animateText
                                ))
                            
                            case "autumn", "fall":
                            return AnyView((Text("Your skin is ") + Text("warm and rich").underline() + Text(" with ")
                                            + Text("deep, earthy").underline() + Text(" tones.")
                                            + Text("You're most likely an").fontWeight(.semibold))
                                .font(.custom("Urbanist-Regular", size: 16))
                                .foregroundColor(.black.opacity(0.7))
                                .opacity(animateText ? 1.0 : 0.0)
                                .offset(y: animateText ? 0 : 20)
                                .animation(
                                    Animation.easeOut(duration: 0.8)
                                        .delay(1.5),
                                    value: animateText
                                ))
                            
                            case "winter":
                            return AnyView((Text("You have ") + Text("cool").underline() + Text(" undertones with ")
                                            + Text("high contrast").underline() + Text(" features.")
                                            + Text("You're most likely a").fontWeight(.semibold))
                                .font(.custom("Urbanist-Regular", size: 16))
                                .foregroundColor(.black.opacity(0.7))
                                .opacity(animateText ? 1.0 : 0.0)
                                .offset(y: animateText ? 0 : 20)
                                .animation(
                                    Animation.easeOut(duration: 0.8)
                                        .delay(1.5),
                                    value: animateText
                                ))
                                
                            
                            default:
                                return AnyView(Text(""))
                            
                        }
                        
                        
                        Text(result)
                            .font(.custom("Urbanist-Regular", size: 48).weight(.medium))
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
                    selectedTab: $selectedTab,
                    imageData: imageData
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
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

