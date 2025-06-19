//
//  ExpandView.swift
//  Chromatccih
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//
import SwiftUI


struct ExpandedColorView: View {
    var result: String
    @Binding var selectedTab: AppTab
    @Binding var isShowingExpandedPalette: Bool
    @Environment(\.dismiss) private var dismiss
    

    private var colorCategories: [ColorCategory] {
        return getColorCategories(for: result)
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background image
            getSeasonalBackground(result: result)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            // Back button - stays at top over background
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding(12)
                    .background(Color.black.opacity(0.05))
                    .clipShape(Circle())
            }
            .padding(.leading, 20)
            .padding(.top, 5) // adjust for safe area / notch

            // White content card
            VStack(spacing: 0) {
                Spacer(minLength: 60) // Push white card below back button

                VStack(spacing: 0) {
                    // Scrollable content inside the card
                    ScrollView {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Your Palette")
                                    .font(.custom("Urbanist-Regular", size: 20).weight(.medium))
                                    .foregroundColor(.black.opacity(0.9))

                                Text("Colors that flatter your tone")
                                    .font(.custom("Urbanist-Regular", size: 12).weight(.light))
                                    .foregroundColor(.black.opacity(0.6))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)

                        LazyVStack(spacing: 20) {
                            ForEach(Array(colorCategories.enumerated()), id: \.offset) { index, category in
                                ColorCategorySection(category: category, categoryIndex: index)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.5))
                        .padding(.horizontal, 8)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

}
