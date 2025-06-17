//
//  PopupInfo.swift
//  Chromatch
//
//  Created by Hafi on 14/06/25.
//

import SwiftUI

struct PopupInfo: View {
    @Binding var isPresented: Bool
    
    private struct InfoItem: Identifiable {
        let id = UUID()
        let iconName: String
        let text: String
    }
    
    private let items: [InfoItem] = [
        InfoItem(iconName: "info.circle", text: "Fit your face to the border"),
        InfoItem(iconName: "info.circle", text: "Ensure enough lighting"),
        InfoItem(iconName: "info.circle", text: "Have an undistracting background"),
        InfoItem(iconName: "info.circle", text: "Remove makeup for better results.")
    ]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isPresented = false
                    }
                }
            VStack(spacing: 20) {
                
                // Instructions list
                VStack(alignment: .leading, spacing: 35) {
                    ForEach(items) { item in
                        HStack(spacing: 15) {
                            Image(systemName:(item.iconName))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text(item.text)
                                .font(.callout)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                Button(action: {
                    isPresented = false
                }) {
                    Text("I Understand")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .clipShape(Capsule())
                }
                
            }
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 25, trailing: 20))
            .frame(width: 350, height: 400)
            .background(.regularMaterial)
            .cornerRadius(25)
            //            .shadow(radius: 10)
        }
        .opacity(isPresented ? 1 : 0)
        .animation(.easeInOut(duration: 0.3), value: isPresented)
    }
}


#Preview {
    PopupInfo(isPresented: .constant(true))
}
