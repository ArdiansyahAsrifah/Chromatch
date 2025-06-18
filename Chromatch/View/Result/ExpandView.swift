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

    private var colorCategories: [ColorCategory] {
        return getColorCategories(for: result)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Tombol back di bagian atas
            HStack {
                Button(action: {
                    isShowingExpandedPalette = false
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(12)
                        .background(Color.black.opacity(0.05))
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.top, 5)
            .padding(.horizontal, 20)

            // Scrollable content
            ScrollView {
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
  
    }
}
