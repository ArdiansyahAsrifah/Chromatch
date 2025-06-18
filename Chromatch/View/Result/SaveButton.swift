//
//  SaveButton.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SaveButton: View {
    var result: String
    var confidence: Float
    var imageData: Data?
    
    @StateObject private var cameraManager = CameraManager()
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            HStack {
                //INI BUTTON BUAT RETRY
                NavigationLink(destination: AnalyzeView(appState: <#T##EnvironmentObject<AppState>#>, selectedTab: <#T##Binding<AppTab>#>, historyManager: <#T##EnvironmentObject<HistoryManager>#>)) {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .opacity(0.5)
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                    }
                    
                    Spacer()
                    
                }
                
                Button(action: {
                    // Simpan data ke HistoryManager atau UserDefaults
                    let newResult = ColorResult(
                        result: result,
                        confidence: confidence,
                        timestamp: Date(),
                        imageData: imageData
                        
                    )
                    historyManager.addResult(newResult)
                    
                    // Dismiss current view terlebih dahulu
                    presentationMode.wrappedValue.dismiss()
                    
                    // Beralih ke tab home setelah delay singkat
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = .home
                        }
                    }
                }) {
                    Text("Save to Profile")
                        .font(.custom("Urbanist-Regular", size: 18).weight(.medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.black.opacity(0.9))
                        )
                }
                .buttonStyle(SpringButtonStyle())
            }
        }) {
            Text("Save")
                .font(.custom("Urbanist-Regular", size: 18).weight(.medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black.opacity(0.9))
                )
        }
        
    }
    
}


