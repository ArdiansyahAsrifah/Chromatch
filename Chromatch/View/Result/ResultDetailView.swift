//
//  ResultDetailView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 12/06/25.
//

import SwiftUI

// ResultDetailView.swift
import SwiftUI

struct ResultDetailView: View {
    var result: String
    var confidence: Float

    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab

    @State private var animateElements = false
    @State private var progressValue: Float = 0.0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        getSeasonalBackground(result: result)
                            .frame(height: 400)

                        VStack(spacing: 0) {
                            CustomNavigationBar {
                                presentationMode.wrappedValue.dismiss()
                            }

                            ProfileHeaderView(
                                result: result,
                                confidence: confidence,
                                animate: animateElements,
                                progressValue: progressValue
                            )

                            SeasonInfoView(
                                result: result,
                                animate: animateElements
                            )

                            Spacer()
                        }
                    }

                    VStack(spacing: 30) {
                        PaletteView(result: result, animate: animateElements)

                        SeasonalTwinsView(result: result, animate: animateElements)

                        ActionButtonsView(
                            onRetry: {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                    isActive = false
                                    selectedTab = .scan
                                }
                            },
                            onSave: {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                    isActive = false
                                    selectedTab = .home
                                }
                            }
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                    .offset(y: animateElements ? 0 : 300)
                    .animation(
                        Animation.spring(response: 0.8, dampingFraction: 0.8).delay(0.4),
                        value: animateElements
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            startAnimations()
        }
    }

    private func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateElements = true
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                progressValue = confidence
            }
        }
    }
}
   
// Preview
struct ResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailView(
            result: "Spring",
            confidence: 1.0,
            isActive: .constant(true),
            selectedTab: .constant(.home)
        )
    }
}
