//
//  MainTab.swift
//  Chromatch
//
//  Created by Felda Everyl on 11/06/25.
//


import SwiftUI

struct MainTabView: View {
    @Binding var selectedTab: AppTab

    var body: some View {
        ZStack(alignment: .bottom) {

            // Custom Tab Bar
            ZStack {
                // Background bar
                HStack (alignment: .center, spacing: 20){
                    Spacer()
                    tabBarItem(image: "HOME", tab: .home)
                    Spacer()
                    Spacer() // For center button space
                    Spacer()
                    tabBarItem(image: "HISTORY", tab: .history)
                    Spacer()
                }
                .frame(width: 180, height: 60)
                .padding(.horizontal, 20)
                .background(.black.opacity(0.3))
                .cornerRadius(50)
                .padding(.bottom, 20)

                // Center Floating Button
                Button(action: {
                    selectedTab = .scan
                }) {
                    Image("CAMERA")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 56)
                        .background(Color.black)
                        .clipShape(Circle())
//                        .shadow(radius: 5)
                }
                .offset(y: -10)
            }
        }
    }

    func tabBarItem(image: String, tab: AppTab) -> some View {
        let isSelected = selectedTab == tab
        let iconName = isSelected ? "\(image)-FILLED" : image
        
        return Button(action: {
            selectedTab = tab
        }) {
            Image(iconName)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? .white : .gray)
        }
    }
    func navigationTitle(for tab: AppTab) -> String {
          switch tab {
          case .home:
              return "HOME / SPRING"
          case .scan:
              return "SCAN / EMPTY"
          case .history:
              return "HISTORY / MARCH"
          }
      }

}



#Preview {
    MainTabView(selectedTab: .constant(.home))
}
