//
//  ChromatchApp.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 09/06/25.
//

import SwiftUI

@main
struct ChromatchApp: App {
    @StateObject var historyManager = HistoryManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyManager)
        }
    }
}
