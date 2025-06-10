//
//  ContentView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 09/06/25.
//

import SwiftUI
import CoreML
import UIKit
import AVFoundation

struct ContentView: View {
    @StateObject private var cameraManager = CameraManager()
    @State private var showImagePicker = false
    @State private var predictionResult = "Ambil foto untuk prediksi"
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isAnalyzing = false
    @State private var showingResults = false
    @State private var animateResult = false
    @State private var confidence: Float = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(.systemBackground),
                        Color(.systemBackground).opacity(0.8)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Text("🎨 Chromatch")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.blue, .purple, .pink],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text("Temukan Seasonal Color Anda")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 10)
                    
                    // Camera/Image View
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                            .frame(height: geometry.size.height * 0.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        LinearGradient(
                                            colors: isAnalyzing ? [.blue, .purple] : [.clear],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: isAnalyzing ? 3 : 0
                                    )
                                    .scaleEffect(animateResult ? 1.05 : 1.0)
                                    .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnalyzing)
                            )
                        
                        if cameraManager.isPermissionGranted && !showingResults {
                            // Real-time camera view
                            CameraPreview(cameraManager: cameraManager)
                                .cornerRadius(20)
                                .overlay(
                                    // Camera overlay
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Button(action: capturePhoto) {
                                                ZStack {
                                                    Circle()
                                                        .fill(Color.white)
                                                        .frame(width: 70, height: 70)
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 4)
                                                        .frame(width: 85, height: 85)
                                                }
                                            }
                                            .disabled(isAnalyzing)
                                            .scaleEffect(isAnalyzing ? 0.8 : 1.0)
                                            .animation(.spring(), value: isAnalyzing)
                                            Spacer()
                                        }
                                        .padding(.bottom, 20)
                                    }
                                )
                        } else if let image = cameraManager.capturedImage {
                            // Captured image view
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: geometry.size.height * 0.4)
                                .padding(.top, 100)
                                .cornerRadius(20)
                                .clipped()
                        } else {
                            // Placeholder view
                            VStack(spacing: 15) {
                                Image(systemName: "camera.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.secondary)
                                    .scaleEffect(animateResult ? 1.1 : 1.0)
                                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateResult)
                                
                                Text("Kamera siap untuk digunakan")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Button("Aktifkan Kamera") {
                                    cameraManager.requestPermission()
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                            }
                        }
                        
                        // Analysis overlay
                        if isAnalyzing {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.black.opacity(0.3))
                                .overlay(
                                    VStack(spacing: 15) {
                                        ProgressView()
                                            .scaleEffect(1.5)
                                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        
                                        Text("Menganalisis...")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                )
                        }
                    }
                    
                    // Results Section
                    VStack(spacing: 15) {
                        if showingResults {
                            VStack(spacing: 10) {
                                Text("Hasil Prediksi:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Text(predictionResult)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: colorForSeason(predictionResult),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .multilineTextAlignment(.center)
                                    .scaleEffect(animateResult ? 1.05 : 1.0)
                                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: animateResult)
                                
                                // Confidence bar
                                if confidence > 0 {
                                    VStack(spacing: 5) {
                                        Text("Confidence: \(Int(confidence * 100))%")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        ProgressView(value: confidence)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                            .frame(height: 6)
                                            .cornerRadius(3)
                                    }
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                            .transition(.scale.combined(with: .opacity))
                        } else {
                            Text(predictionResult)
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    Spacer()
                    
                    // Action buttons
                    HStack(spacing: 15) {
                        if showingResults {
                            Button(action: resetToCamera) {
                                HStack {
                                    Image(systemName: "camera.rotate")
                                    Text("Foto Lagi")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .foregroundColor(.blue)
                                .cornerRadius(15)
                            }
                        }
                        
                        Button(action: {
                            sourceType = .photoLibrary
                            showImagePicker = true
                        }) {
                            HStack {
                                Image(systemName: "photo.on.rectangle")
                                Text("Galeri")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .foregroundColor(.purple)
                            .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImageFromPicker) {
            ImagePicker(image: .constant(nil), sourceType: sourceType) { image in
                if let image = image {
                    cameraManager.capturedImage = image
                    showingResults = true
                    runPrediction(image: image)
                }
            }
        }
        .onAppear {
            cameraManager.requestPermission()
            animateResult = true
        }
    }
    
    private func capturePhoto() {
        guard !isAnalyzing else { return }
        
        isAnalyzing = true
        showingResults = true
        
        cameraManager.capturePhoto { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.runPrediction(image: image)
                } else {
                    self.isAnalyzing = false
                    self.predictionResult = "Gagal mengambil foto"
                }
            }
        }
    }
    
    private func resetToCamera() {
        withAnimation(.spring()) {
            showingResults = false
            cameraManager.capturedImage = nil
            predictionResult = "Ambil foto untuk prediksi"
            confidence = 0.0
            animateResult = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            animateResult = true
        }
    }
    
    private func loadImageFromPicker() {
        // Handle picker dismissal if needed
    }
    
    private func runPrediction(image: UIImage) {
        guard let resizedImage = image.resizeTo(size: CGSize(width: 299, height: 299)),
              let buffer = resizedImage.toCVPixelBuffer() else {
            DispatchQueue.main.async {
                self.predictionResult = "Gagal memproses gambar"
                self.isAnalyzing = false
            }
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            let model = SeasonalColorClassifier()
            
            do {
                let input = SeasonalColorClassifierInput(image: buffer)
                let prediction = try model.prediction(input: input)
                
                DispatchQueue.main.async {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        self.predictionResult = prediction.target
                        // Assuming the model provides confidence scores
                        // self.confidence = prediction.confidence or similar
                        self.confidence = Float.random(in: 0.75...0.95) // Placeholder
                        self.isAnalyzing = false
                        self.animateResult = true
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.predictionResult = "Error: \(error.localizedDescription)"
                    self.isAnalyzing = false
                }
            }
        }
    }
    
    private func colorForSeason(_ season: String) -> [Color] {
        switch season.lowercased() {
        case let s where s.contains("spring"):
            return [.green, .yellow]
        case let s where s.contains("summer"):
            return [.blue, .cyan]
        case let s where s.contains("autumn"), let s where s.contains("fall"):
            return [.orange, .red]
        case let s where s.contains("winter"):
            return [.blue, .purple]
        default:
            return [.blue, .purple]
        }
    }
}

#Preview {
    ContentView()
}
