//  Created by Hafi on 11/06/25.
//

import Foundation
import Combine
import SwiftUI

// MARK: - State Enums
// Describes the position of the user's face relative to the guide circle.
enum FacePositionState {
    case notFound
    case tooFar
    case tooClose
    case offCenter
    case correct
    
    var instructionText: String {
        switch self {
        case .notFound:
            return "Position your face in the circle"
        case .tooFar:
            return "Move Closer"
        case .tooClose:
            return "Move Further Away"
        case .offCenter:
            return "Center Your Face"
        case .correct:
            return "Perfect! Hold Still"
        }
    }
    
    var color: Color {
        switch self {
        case .correct:
            return .green
        default:
            return .red
        }
    }
}

// Describes the lighting conditions of the camera feed.
enum LightingState {
    case normal
    case tooDim
    case tooBright
    
    var warningText: String? {
        switch self {
        case .normal:
            return nil
        case .tooDim:
            return "Lighting is too dim"
        case .tooBright:
            return "Lighting is too bright"
        }
    }
}


// MARK: - View Model
class FaceScannerViewModel: ObservableObject {
    @Published var facePositionState: FacePositionState = .notFound
    @Published var lightingState: LightingState = .normal
    
    var areAllCriteriaMet: Bool {
            return facePositionState == .correct && lightingState == .normal
    }
    
    // CHANGE the type of brightness to CGFloat
    func update(faceObservation: CGRect?, brightness: CGFloat?) {
        // --- Lighting Check ---
        if let brightness = brightness {
            // thresholds for a 0-255 scale
            print(brightness)
            if brightness < 30 {      // Very dark
                self.lightingState = .tooDim
            } else if brightness > 150 { // Very bright
                self.lightingState = .tooBright
            } else {
                self.lightingState = .normal
            }
        } else {
            self.lightingState = .normal
        }

        // --- Face Position Check---
        guard let faceBoundingBox = faceObservation else {
            self.facePositionState = .notFound
            return
        }
        
        let targetWidth: CGFloat = 0.45
        let targetHeight: CGFloat = 0.45
        let targetCenterX: CGFloat = 0.5
        let targetCenterY: CGFloat = 0.5
        
        let centerTolerance: CGFloat = 0.1
        let sizeTolerance: CGFloat = 0.2

        let isCentered = abs(faceBoundingBox.midX - targetCenterX) < centerTolerance &&
                         abs(faceBoundingBox.midY - targetCenterY) < centerTolerance
        
        
        if faceBoundingBox.width < targetWidth - sizeTolerance || faceBoundingBox.height < targetHeight - sizeTolerance {
            self.facePositionState = .tooFar
            return
        }
        
        if faceBoundingBox.width > targetWidth + sizeTolerance || faceBoundingBox.height > targetHeight + sizeTolerance {
            self.facePositionState = .tooClose
            return
        }
        
        if !isCentered {
            self.facePositionState = .offCenter
            return
        }
        
        self.facePositionState = .correct
    }
}
