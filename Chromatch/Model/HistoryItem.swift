//
//  HistoryItem.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import Foundation

struct HistoryItem: Identifiable {
    let id = UUID()
    let season: String
    let confidence: Float
    let date: Date
}

extension HistoryItem {
    init(from colorResult: ColorResult) {
        self.season = colorResult.result
        self.confidence = colorResult.confidence
        self.date = colorResult.timestamp
    }
}

