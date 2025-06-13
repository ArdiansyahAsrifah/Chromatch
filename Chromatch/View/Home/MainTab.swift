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
                    tabBarItem(icon: "house.fill", tab: .home)
                    Spacer()
                    Spacer() // For center button space
                    Spacer()
                    tabBarItem(icon: "clock.fill", tab: .history)
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
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .frame(width: 60, height: 56)
                        .background(Color.white)
                        .clipShape(Circle())
//                        .shadow(radius: 5)
                }
                .offset(y: -10)
            }
        }
    }

    // Helper function for tab icons
    func tabBarItem(icon: String, tab: AppTab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(selectedTab == tab ? .white : .gray)
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
