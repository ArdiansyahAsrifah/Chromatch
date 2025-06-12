//
//  HistoryModel.swift
//  Chromatch
//
//  Created by Felda Everyl on 11/06/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class AnalysisResult {
    var date: Date
    var season: String
    var confidence: Double
    var imageName: String

    init(date: Date, season: String, confidence: Double, imageName: String) {
        self.date = date
        self.season = season
        self.confidence = confidence
        self.imageName = imageName
    }
}

//import Foundation
//import SwiftData
//
//@Model
//class AnalysisResult {
//    var date: Date
//    var season: String
//    var confidence: Double
//    var imageData: Data?  // Optional: store user’s image if needed
//
//    init(date: Date = Date(), season: String, confidence: Double, imageData: Data? = nil) {
//        self.date = date
//        self.season = season
//        self.confidence = confidence
//        self.imageData = imageData
//    }
//}
