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
    
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
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
            Text("Save")
                .font(.custom("Urbanist-Regular", size: 18).weight(.medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black.opacity(0.9))
                )
        }
        .buttonStyle(SpringButtonStyle())
    }
}


