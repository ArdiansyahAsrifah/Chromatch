// HomeView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 14/06/25.

import SwiftData
import SwiftUI

struct HomeView: View {
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    @EnvironmentObject var historyManager: HistoryManager
    
    @State private var progressValue: Float = 0.0
    @State private var showExpandedPalette = false
    @Environment(\.presentationMode) var presentationMode
    
    
    // Computed properties untuk mendapatkan data terbaru
    private var latestResult: ColorResult? {
        historyManager.results.first
    }
    
    private var displayResult: String {
        latestResult?.result ?? "No Result"
    }
    
    private var displayConfidence: Float {
        latestResult?.confidence ?? 0.0
    }
    
    private var displayImageData: Data? {
        latestResult?.imageData
    }
    
    var body: some View {
        NavigationStack {
            if historyManager.results.isEmpty {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundStyle(.activeBTEnd)
                        .opacity(0.2)
                    VStack {
                        emptyStateView
                        // Add button to navigate to camera
                        
                    }
                }
            } else {
                GeometryReader { geometry in
                    ZStack {
                        getSeasonalBackground(result: displayResult)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 0) {
                            HeaderView(
                                result: displayResult,
                                progressValue: $progressValue,
                                confidence: displayConfidence,
                                imageData: displayImageData
                            )
                            .padding(.top,30)
                            
                            ContentSectionsView(
                                result: displayResult,
                                showExpandedPalette: $showExpandedPalette,
                                selectedTab: $selectedTab
                            )
                        }.frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            (
                Text("Ready to unlock the colors that were made for you?\n\nLet's start")
                + Text("with a selfie").bold()
                
            )
            .font(.custom("Urbanist-Regular", size: 20))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.horizontal, 30)
            .padding(.top, -50)
            .multilineTextAlignment(.center)
            
//            Button {
//                selectedTab = .scan
//            } label: {
//                Image("CAMERA")
//                    .font(.system(size: 24))
//                    .foregroundColor(.white)
//                    .frame(width: 60, height: 56)
//                    .background(Color.black)
//                    .clipShape(Circle())
//                
//            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            isActive: .constant(true),
            selectedTab: .constant(.home)
        )
        .environmentObject(HistoryManager())
    }
}
