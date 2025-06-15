//
//  ColorResult.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.


import Foundation

struct ColorResult: Identifiable, Codable {
    let id: UUID
    let result: String
    let confidence: Float
    let timestamp: Date
    
    init(id: UUID = UUID(), result: String, confidence: Float, timestamp: Date) {
        self.id = id
        self.result = result
        self.confidence = confidence
        self.timestamp = timestamp
    }
}
