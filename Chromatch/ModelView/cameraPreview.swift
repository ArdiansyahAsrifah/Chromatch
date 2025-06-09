//
//  cameraPreview.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 09/06/25.
//

import SwiftUI
import AVFoundation

// MARK: - Camera Preview

struct CameraPreview: UIViewRepresentable {
    let cameraManager: CameraManager
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: cameraManager.captureSession)
        previewLayer.frame = view.frame
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
