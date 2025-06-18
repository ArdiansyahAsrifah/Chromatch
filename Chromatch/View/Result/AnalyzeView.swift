//
// AnalyzeView.swift
//

import SwiftUI
import VideoToolbox
import SwiftData
import Vision
import CoreML

struct AnalyzeView: View {
    // MARK: - Properties
    @StateObject private var viewModel = FaceScannerViewModel()
    @StateObject private var cameraManager = CameraManager()
    @State private var capturedImageForAnalysis: UIImage?
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) private var modelContext
    
    @State private var capturedImageData: Data?
    @State private var predictionResult = "Ambil foto untuk prediksi"
    @State private var isAnalyzing = false
    @State private var confidence: Double = 0.0
    @State private var isInfoPopupPresented = false
    @State private var navigateToSplash = false
    @Binding var selectedTab: AppTab
    
    @EnvironmentObject var historyManager: HistoryManager
    
    @State private var showPermissionAlert = false

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                switch cameraManager.permissionStatus {
                case .authorized:
                    if let image = capturedImageForAnalysis {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                            .ignoresSafeArea()
                    } else {
                        CameraPreview(cameraManager: cameraManager)
                            .ignoresSafeArea()
                    }
                case .denied:
                    permissionDeniedView
                case .notDetermined:
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Requesting Camera Permission...")
                        .foregroundColor(.white)
                default:
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Camera access is restricted for this device.")
                        .foregroundColor(.white)
                }

                if cameraManager.permissionStatus == .authorized {
                    cameraOverlayView
                }
            }
            .environmentObject(historyManager)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                cameraManager.checkAndRequestPermission()
            }
            .onDisappear {
                cameraManager.stopSession()
//                navigateToSplash = false
            }
            
            .onChange(of: cameraManager.permissionStatus) { _, newStatus in
                if newStatus == .authorized {
                    cameraManager.viewModel = viewModel
                    cameraManager.startSession()
                } else if newStatus == .denied {
                    showPermissionAlert = true
                }
            }
            .alert("Camera Access Required", isPresented: $showPermissionAlert) {
                Button("Go to Settings") {
                    if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }
                Button("Cancel", role: .cancel) {
                    selectedTab = .home
                }
            } message: {
                Text("To continue, please allow camera access in your device settings.")
            }
            .navigationDestination(isPresented: $navigateToSplash) {
                 SplashView(result: predictionResult, confidence: Float(confidence), selectedTab: $selectedTab, imageData: capturedImageData)
            }
            .onChange(of: capturedImageForAnalysis) { _, newImage in
                if let imageToAnalyze = newImage {
                    self.isAnalyzing = true
                    self.runPrediction(image: imageToAnalyze)
                }
            }
        }
    }

    // MARK: - Subviews
    
    private var cameraOverlayView: some View {
        Group {
            VStack {
                HStack {
                    Button(action: { selectedTab = .home }) {
                        Image(systemName: "chevron.left")
                            .font(.title3).foregroundColor(.white).padding(12)
                            .background(Color.secondary.opacity(0.2)).clipShape(Circle())
                    }
                    Spacer()
                    Button(action: { isInfoPopupPresented = true }) {
                        Image(systemName: "questionmark.circle")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24).padding(.top, 60)
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            
            if capturedImageForAnalysis == nil {
                VStack {
                    Spacer()
                    ZStack {
                        Ellipse()
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [8, 6]))
                            .frame(width: 280, height: 350)
                            .foregroundColor(viewModel.areAllCriteriaMet ? .green : .white)
                            .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    }
                    .padding(.top, 100)
                    Spacer()
                    VStack(spacing: 15) {
                        if let warningText = viewModel.lightingState.warningText {
                            HStack(spacing: 8) {
                                Image(systemName: "lightbulb.slash.fill")
                                    .foregroundColor(.yellow)
                                Text(warningText)
                                    .font(.custom("Urbanist-Regular", size: 14)
                                        .weight(.medium))
                                    .foregroundColor(.yellow)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.black.opacity(0.6)))
                        } else if viewModel.areAllCriteriaMet {
                            Text("You're all set!")
                                .font(.custom("Urbanist-Regular", size: 14)
                                    .weight(.medium))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 4)
                                .background(RoundedRectangle(cornerRadius: 24).fill(Color(red: 0.2, green: 0.78, blue: 0.35).opacity(0.75)))
                        } else {
                            Text(viewModel.facePositionState.instructionText)
                                .font(.custom("Urbanist-Regular", size: 14).weight(.medium))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 4)
                                .background(RoundedRectangle(cornerRadius: 24).fill(Color.black.opacity(0.6)))
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    Button(action: capturePhoto) {
                        Image("buttonIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                    }
                    .disabled(!viewModel.areAllCriteriaMet)
                    .opacity(viewModel.areAllCriteriaMet ? 1.0 : 0.5)
                    .scaleEffect(viewModel.areAllCriteriaMet ? 1.0 : 0.9)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    .padding(.bottom, 50)
                }
            }
            
            if isAnalyzing {
                Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.8)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    Text("Menganalisis...")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            }
            if isInfoPopupPresented {
                PopupInfo(isPresented: $isInfoPopupPresented).transition(.opacity)
            }
        }
    }

    private var permissionDeniedView: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                Image(systemName: "camera.slash.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white.opacity(0.7))
                Text("Camera Access Denied")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Chromatch requires camera access to analyze your personal color. Please enable it in your device settings.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                Button("Go to Settings") {
                    if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }
                .font(.headline).padding(.horizontal, 20).padding(.vertical, 12)
                .background(Color.blue).foregroundColor(.white).cornerRadius(12).padding(.top)
            }
            
            VStack {
                HStack {
                    Button(action: { selectedTab = .home }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    private func capturePhoto() {
        cameraManager.captureCurrentImage { pixelBuffer in
            guard let buffer = pixelBuffer, let image = imageFromPixelBuffer(buffer) else { return }
            DispatchQueue.main.async {
                self.cameraManager.stopSession()
                self.capturedImageForAnalysis = image
            }
        }
    }
    
    func runPrediction(image: UIImage) {
        guard let ciImage = CIImage(image: image) else { return }
        do {
            let model = try VNCoreMLModel(for: SeasonalColorClassifier().model)
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation], let topResult = results.first {
                    DispatchQueue.main.async {
                        self.predictionResult = topResult.identifier
                        self.confidence = Double(topResult.confidence)
                        let imageData = image.jpegData(compressionQuality: 0.8)
                        self.capturedImageData = imageData
                        let historyItem = AnalysisResult(season: topResult.identifier, confidence: Double(topResult.confidence), imageData: imageData)
                        modelContext.insert(historyItem)
                        self.isAnalyzing = false
                        self.navigateToSplash = true
                    }
                }
            }
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            try handler.perform([request])
        } catch {
            print("Failed to perform prediction: \(error.localizedDescription)")
        }
    }
    
    private func imageFromPixelBuffer(_ pixelBuffer: CVPixelBuffer) -> UIImage? {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)
        guard let cgImage = cgImage else { return nil }
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: .right)
    }
}
