//
//  HistoryManager.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI
import Combine

class HistoryManager: ObservableObject {
    @Published var results: [ColorResult] = []
    
    init() {
        loadResults()
    }
    
    func addResult(_ result: ColorResult) {
        // Tambahkan di awal array (hasil terbaru)
        results.insert(result, at: 0)
        saveResults()
    }
    
    func removeResult(_ result: ColorResult) {
        results.removeAll { $0.id == result.id }
        saveResults()
    }
    
    func saveResults() {
        // Simpan ke UserDefaults atau Core Data
        if let encoded = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encoded, forKey: "colorResults")
        }
    }
    
    func clearAllResults() {
        results.removeAll()
        saveResults()
    }
    
    private func loadResults() {
        // Load dari UserDefaults
        if let data = UserDefaults.standard.data(forKey: "colorResults"),
           let decoded = try? JSONDecoder().decode([ColorResult].self, from: data) {
            results = decoded
        }
    }
}


