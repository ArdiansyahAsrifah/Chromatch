// cameraManager.swift

import SwiftUI
import AVFoundation
import Vision

// This class now controls the live video feed and analysis.
class CameraManager: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @Published var permissionStatus: AVAuthorizationStatus = .notDetermined
    
    let captureSession = AVCaptureSession()
    
    weak var viewModel: FaceScannerViewModel?
    
    // --- Private properties for analysis ---
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let context = CIContext()
    private var lastAnalysisTime: TimeInterval = 0
    private let analysisInterval: TimeInterval = 0.7
    
    // A one-time closure for capturing a single frame.
    private var onCaptureFrame: ((CVPixelBuffer?) -> Void)?
    
    override init() {
        super.init()
        setupCamera()
    }
    
    func checkAndRequestPermission() {
        let currentStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        // Update status on the main thread
        DispatchQueue.main.async {
            self.permissionStatus = currentStatus
        }
        
        // If not determined, trigger the system prompt
        if currentStatus == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    self.permissionStatus = granted ? .authorized : .denied
                }
            }
        }
    }
    
    private func setupCamera() {
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let videoInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            return
        }
        
        captureSession.beginConfiguration()
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }
        
        videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        if captureSession.canAddOutput(videoDataOutput) {
            captureSession.addOutput(videoDataOutput)
        }
        
        captureSession.commitConfiguration()
    }
    
    func startSession() {
        guard permissionStatus == .authorized, !captureSession.isRunning else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    func stopSession() {
        if captureSession.isRunning {
            DispatchQueue.global(qos: .background).async {
                self.captureSession.stopRunning()
            }
        }
    }
    
    // fungsi untuk capture image
    public func captureCurrentImage(completion: @escaping (CVPixelBuffer?) -> Void) {
        self.onCaptureFrame = completion
    }
    
    // method untuk live capture video
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        
        if let completion = self.onCaptureFrame {
            completion(pixelBuffer)
            self.onCaptureFrame = nil // Clear the request
        }
        
        let currentTime = CACurrentMediaTime()
        guard currentTime - lastAnalysisTime > analysisInterval else { return }
        lastAnalysisTime = currentTime
        
        
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: ciImage.extent)])!
        let outputImage = filter.outputImage!
        var bitmap = [UInt8](repeating: 0, count: 4)
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        let brightnessValue = (0.299 * CGFloat(bitmap[0]) + 0.587 * CGFloat(bitmap[1]) + 0.114 * CGFloat(bitmap[2]))
        
        let faceRequest = VNDetectFaceRectanglesRequest { [weak self] request, error in
            guard let self = self,
                  let results = request.results as? [VNFaceObservation],
                  let firstResult = results.first else {
                DispatchQueue.main.async { self?.viewModel?.update(faceObservation: nil, brightness: brightnessValue) }
                return
            }
            DispatchQueue.main.async { self.viewModel?.update(faceObservation: firstResult.boundingBox, brightness: brightnessValue) }
        }
        try? VNImageRequestHandler(cmSampleBuffer: sampleBuffer, options: [:]).perform([faceRequest])
    }
}
