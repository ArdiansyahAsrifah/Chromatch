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
        InfoItem(iconName: "Center", text: "Center your face in the frame"),
        InfoItem(iconName: "Natural", text: "Use natural lighting"),
        InfoItem(iconName: "Background", text: "Find a plain background"),
        InfoItem(iconName: "Makeup", text: "Avoid wearing makeup")
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
                VStack(spacing:4){
                    Text("Get the best results")
                        .font(.custom("Urbanist-Regular", size: 16).weight(.semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.09, green: 0.02, blue: 0.08))
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    Text("Follow these tips for better results")
                        .font(.custom("Urbanist-Regular", size: 12)) //Nunito
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.09, green: 0.02, blue: 0.08))
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                
                // Instructions list
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(items.indices, id: \.self) { index in
                        HStack(spacing: 15) {
                            Image(items[index].iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)

                            Text(items[index].text)
                                .font(.custom("Urbanist-Regular", size: 14).weight(.medium))
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 10)

                        if index < items.count - 1 {
                            Divider()
                                .background(Color.gray.opacity(0.4)) // light gray
                                .padding(.leading, 45) // aligns with text
                        }
                    }
                }
                .padding(.top, 20)

                
                Button(action: {
                    isPresented = false
                }) {
                    Text("Got it!")
                        .font(.custom("Urbanist-Regular", size: 16).weight(.medium))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .clipShape(Capsule())
                }
                
            }
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 25, trailing: 20))
            .frame(width: 300, height: 400)
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
