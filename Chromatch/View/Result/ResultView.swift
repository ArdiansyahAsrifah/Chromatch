import SwiftUI
import VideoToolbox

struct ResultView: View {
    // MARK: - Properties
    @StateObject private var viewModel = FaceScannerViewModel()
    @StateObject private var cameraManager = CameraManager()
    @State private var capturedImageForAnalysis: UIImage?
    
    @State private var predictionResult = "Ambil foto untuk prediksi"
    @State private var isAnalyzing = false
    @State private var confidence: Float = 0.0
    @State private var navigateToSplash = false
    @Binding var selectedTab: AppTab
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if let image = capturedImageForAnalysis {
                // klo ada gambar, munculin gambarnya
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                // jika belum ada gambar, munculin kamera
                if cameraManager.isPermissionGranted {
                    CameraPreview(cameraManager: cameraManager)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                    Text("Camera permission is required.").foregroundColor(.white)
                }
            }
            
            // Overlay UI
            VStack {
                // munculin scanner UI klo belum ada gambar
                if capturedImageForAnalysis == nil {
                    Spacer()
                
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 4, dash: [10]))
                        .frame(width: 300, height: 300)
                        .foregroundColor(viewModel.facePositionState.color)
                        .padding(.top, 20)
                    
                    // Instruction Text
                    Text(viewModel.facePositionState.instructionText)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .animation(.none, value: viewModel.facePositionState)
                    
                    // Lighting Warning
                    if let warningText = viewModel.lightingState.warningText {
                        HStack {
                            Image(systemName: "lightbulb.slash.fill")
                            Text(warningText)
                        }.font(.headline)
                            .foregroundColor(.yellow)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                    }
                    
                    // Button untuk ambil foto
                    Button(action: capturePhoto) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 55, height: 55)
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 70, height: 70)
                        }
                    }
                    .disabled(!viewModel.areAllCriteriaMet)
                    .opacity(viewModel.areAllCriteriaMet ? 1.0 : 0.4)
                    .padding(.bottom, 35)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: viewModel.areAllCriteriaMet)
            
            if isAnalyzing {
                
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
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
        .sheet(isPresented: $navigateToSplash) {
            NavigationStack {
                SplashView(result: predictionResult, confidence: confidence, isActive: $navigateToSplash, selectedTab: $selectedTab)
            }
        }
        .onChange(of: capturedImageForAnalysis) { _, newImage in
            if let imageToAnalyze = newImage {
                self.isAnalyzing = true
                self.runPrediction(image: imageToAnalyze)
            }
        }
        .onChange(of: navigateToSplash) { _, newValue in
            // splash screen dismiss, reset semua data dan start sesi baru
            if !newValue {
                self.capturedImageForAnalysis = nil
                self.cameraManager.startSession()
            }
        }
        .onAppear {
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
                        self.confidence = Float(prediction.targetProbability[prediction.target] ?? 0.0)
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
