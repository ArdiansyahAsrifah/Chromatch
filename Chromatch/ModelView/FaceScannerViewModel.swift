//  Created by Hafi on 11/06/25.
//

import Foundation
import Combine
import SwiftUI

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
