import SwiftUI
import VideoToolbox

struct AnalyzeView: View {
    // MARK: - Properties
    @StateObject private var viewModel = FaceScannerViewModel()
    @StateObject private var cameraManager = CameraManager()
    @State private var capturedImageForAnalysis: UIImage?
    @EnvironmentObject var appState: AppState
    
    @State private var predictionResult = "Ambil foto untuk prediksi"
    @State private var isAnalyzing = false
    @State private var confidence: Double = 0.0
    @State private var isInfoPopupPresented = false
    @State private var navigateToSplash = false
    @Binding var selectedTab: AppTab
    
    @EnvironmentObject var historyManager: HistoryManager
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if let image = capturedImageForAnalysis {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()

            } else {
                // jika belum ada gambar, munculin kamera
                if cameraManager.isPermissionGranted {
                    CameraPreview(cameraManager: cameraManager)
                        .ignoresSafeArea()
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Camera permission is required.").foregroundColor(.white)
                }
            }
            
            // Overlay UI
            VStack {
                if capturedImageForAnalysis == nil {
                    Spacer()
                    
                    // Face detection oval outline
                    ZStack {
                        // Oval outline with dashed border
                        Ellipse()
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [8, 6]))
                            .frame(width: 280, height: 350)
                            .foregroundColor(viewModel.areAllCriteriaMet ? .green : .white)
                            .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    }
                    .padding(.top, 100)
                    
                    Spacer()
                    
                    // Status message
                    VStack(spacing: 15) {
                        
                        // Warning
                        if let warningText = viewModel.lightingState.warningText {
                            HStack(spacing: 8) {
                                Image(systemName: "lightbulb.slash.fill")
                                    .foregroundColor(.yellow)
                                Text(warningText)
                                    .foregroundColor(.yellow)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.black.opacity(0.6))
                            )
                        } else {
                            if viewModel.areAllCriteriaMet {
                                // "You're all set!" message
                                Text("You're all set!")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(
                                        Capsule()
                                            .fill(Color.green)
                                    )
                            } else {
                                // Instruction text
                                Text(viewModel.facePositionState.instructionText)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black.opacity(0.6))
                                    )
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    
                    Spacer()
                    
                    // Camera capture button
                    Button(action: capturePhoto) {
                        ZStack {
                            // Outer ring
                            Circle()
                                .stroke(Color.white.opacity(0.8), lineWidth: 4)
                                .frame(width: 80, height: 80)
                            
                            // Inner circle
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Circle()
                                        .fill(Color.black.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                    }
                    .disabled(!viewModel.areAllCriteriaMet)
                    .opacity(viewModel.areAllCriteriaMet ? 1.0 : 0.5)
                    .scaleEffect(viewModel.areAllCriteriaMet ? 1.0 : 0.9)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
                    .padding(.bottom, 150)
                }
            }
            
            //Button for navigation and help
            VStack {
                HStack {
                    Button(action: {
                        selectedTab = .home
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 24)
                    .padding(.top, 60)   // Indent from the top to avoid the notch
                    
                    Spacer() // Pushes the button to the left
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isInfoPopupPresented = true
                        }
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .padding(12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 24) // Indent from the right edge
                    .padding(.top, 60)   // Indent from the top to avoid the notch
                    
                }
                Spacer() // Pushes the HStack to the top
            }
            .edgesIgnoringSafeArea(.top)
            
            // Loading overlay
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
                PopupInfo(isPresented: $isInfoPopupPresented)
                    .transition(.opacity)
            }
        }
        .environmentObject(historyManager)
        .sheet(isPresented: $navigateToSplash) {
            NavigationStack {
                SplashView(result: predictionResult, confidence: Float(confidence), isActive: $navigateToSplash, selectedTab: $selectedTab)
            }
        }
        .onChange(of: capturedImageForAnalysis) { _, newImage in
            if let imageToAnalyze = newImage {
                self.isAnalyzing = true
                self.runPrediction(image: imageToAnalyze)
            }
        }
        .onChange(of: navigateToSplash) { _, newValue in
            if !newValue {
                self.capturedImageForAnalysis = nil
                self.cameraManager.startSession()
            }
        }
        .onAppear {
            if !appState.hasShownInitialPopup {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut) {
                        isInfoPopupPresented = true
                        
                    }
                    appState.hasShownInitialPopup = true
                }
            }
            
            cameraManager.viewModel = viewModel
            cameraManager.startSession()
        }
        .onDisappear {
            cameraManager.stopSession()
        }
    }
    
    // MARK: - Functions
    
    private func capturePhoto() {
        cameraManager.captureCurrentImage { pixelBuffer in
            guard let buffer = pixelBuffer,
                  let image = imageFromPixelBuffer(buffer) else { return }
            
            DispatchQueue.main.async {
                // Stop the session first, lalu set the image.
                self.cameraManager.stopSession()
                self.capturedImageForAnalysis = image
            }
        }
    }
    
    private func runPrediction(image: UIImage) {
        guard let resizedImage = image.resizeTo(size: CGSize(width: 299, height: 299)),
              let bufferForModel = resizedImage.toCVPixelBuffer() else {
            DispatchQueue.main.async { self.isAnalyzing = false }
            return
        }

        DispatchQueue.global(qos: .userInteractive).async {
            let model = SeasonalColorClassifier()
            do {
                let input = SeasonalColorClassifierInput(image: bufferForModel)
                let prediction = try model.prediction(input: input)

                DispatchQueue.main.async {
                    withAnimation {
                        self.predictionResult = prediction.target
                        self.confidence = Double(Float(prediction.targetProbability[prediction.target] ?? 0.0))

                        // ✅ Convert image to Data
                        let imageData = image.jpegData(compressionQuality: 0.8)

                        // ✅ Save to SwiftData
                        let historyItem = AnalysisResult(
                            season: predictionResult,
                            confidence: confidence,
                            imageData: imageData
                        )
                        modelContext.insert(historyItem)

                        self.isAnalyzing = false
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


    private func imageFromPixelBuffer(_ pixelBuffer: CVPixelBuffer) -> UIImage? {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)
        guard let cgImage = cgImage else { return nil }
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: .right)
    }
}
