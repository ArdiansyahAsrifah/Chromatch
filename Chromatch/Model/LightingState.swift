//
//  LightingState.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

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
