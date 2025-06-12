//
//  ResultView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct ResultView: View {
    @StateObject private var cameraManager = CameraManager()
    @State private var showImagePicker = false
    @State private var predictionResult = "Ambil foto untuk prediksi"
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isAnalyzing = false
    @State private var showingResults = false
    @State private var animateResult = false
    @State private var confidence: Float = 0.0
    @State private var navigateToSplash = false

    
    var body: some View {
        ZStack {
            // Fullscreen Camera
            if cameraManager.isPermissionGranted && !showingResults {
                CameraPreview(cameraManager: cameraManager)
                    .edgesIgnoringSafeArea(.all)
            } else if let image = cameraManager.capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Color.black.edgesIgnoringSafeArea(.all)
            }

            // Overlay UI
            VStack {
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
                        .foregroundColor(.white)
                }
                .padding(.top, 60)

                Spacer()

                // Capture Button
                if !showingResults {
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
                    .padding(.bottom, 40)
                }
            }

            // Analysis Overlay
            if isAnalyzing {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 15) {
                    ProgressView()
                        .scaleEffect(1.5)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))

                    Text("Menganalisis...")
                        .font(.headline)
                        .foregroundColor(.white)
                }
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
        .fullScreenCover(isPresented: $navigateToSplash) {
            SplashView(result: predictionResult, confidence: confidence)
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
    
    func resetToCamera() {
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
                        self.confidence = Float(prediction.targetProbability[prediction.target] ?? 0.0)
                        self.isAnalyzing = false
                        self.animateResult = true
                        self.navigateToSplash = true
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

#Preview{
    ResultView()
}
