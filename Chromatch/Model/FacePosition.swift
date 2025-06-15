//
//  FacePosition.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

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
