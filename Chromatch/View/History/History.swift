//// HistoryView.swift
//// Chromatch
////
//// Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//
//import SwiftUI
//
//struct HistoryView: View {
//    @EnvironmentObject var historyManager: HistoryManager
//    @State private var showingDeleteAlert = false
//    @State private var itemToDelete: ColorResult?
//    @State private var searchText = ""
//    @State private var selectedMonthFilter: String = "All"
//    
//    var filteredResults: [ColorResult] {
//        if selectedMonthFilter == "All" {
//            return historyManager.results
//        } else {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "MMMM"
//            return historyManager.results.filter { result in
//                formatter.string(from: result.timestamp) == selectedMonthFilter
//            }
//        }
//    }
//
//    var availableMonths: [String] {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM"
//        let months = Set(historyManager.results.map { formatter.string(from: $0.timestamp) })
//        return ["All"] + months.sorted()
//    }
//
//    
//    // Group results by month
//    var groupedResults: [(String, [ColorResult])] {
//        let calendar = Calendar.current
//        let grouped = Dictionary(grouping: filteredResults) { result in
//            let components = calendar.dateComponents([.year, .month], from: result.timestamp)
//            let date = calendar.date(from: components) ?? result.timestamp
//            return date
//        }
//        
//        return grouped
//            .sorted { $0.key > $1.key } // Most recent first
//            .map { (date, results) in
//                let formatter = DateFormatter()
//                formatter.dateFormat = "MMMM"
//                let monthName = formatter.string(from: date)
//                return (monthName, results.sorted { $0.timestamp > $1.timestamp })
//            }
//    }
//    
//    var body: some View {
//        ZStack {
//            
//            Rectangle()
//                .ignoresSafeArea()
//                .foregroundStyle(.activeBTEnd)
//                .opacity(0.2)
//            
//            VStack(spacing: 0) {
//                Spacer(minLength: 50)
//                // Header dengan Search Bar
//                headerView
//                
//                if filteredResults.isEmpty {
//                    emptyStateView
//                } else {
//                    // Results List grouped by month
//                    ScrollView {
//                        LazyVStack(spacing: 24) {
//                            ForEach(groupedResults, id: \.0) { monthGroup in
//                                MonthSectionView(
//                                    monthName: monthGroup.0,
//                                    results: monthGroup.1,
//                                    onDelete: { result in
//                                        itemToDelete = result
//                                        showingDeleteAlert = true
//                                    }
//                                )
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.top, 20)
//                        .padding(.bottom, 100) // Extra space for tab bar
//                    }
//                }
//            }
////            .background(Color(.systemGroupedBackground))
//            .navigationBarHidden(true)
//            .alert("Delete Result", isPresented: $showingDeleteAlert) {
//                Button("Cancel", role: .cancel) { }
//                Button("Delete", role: .destructive) {
//                    if let item = itemToDelete {
//                        withAnimation(.spring()) {
//                            historyManager.removeResult(item)
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    private var headerView: some View {
//        VStack(spacing: 16) {
//            // Title
//            HStack {
//                
//                
//                Spacer()
//                
//                if !historyManager.results.isEmpty {
//                    Button("Clear All") {
//                        withAnimation(.spring()) {
//                            historyManager.clearAllResults()
//                        }
//                    }
//                    .foregroundColor(.red)
//                    .font(.system(size: 16, weight: .medium))
//                }
//            }
//        }
//        .padding(.horizontal, 20)
//        .padding(.top, 20)
//    }
//    
//    private var emptyStateView: some View {
//        VStack(spacing: 24) {
//            Spacer()
//            
//            Image(systemName: "clock.arrow.circlepath")
//                .font(.system(size: 64))
//                .foregroundColor(.secondary)
//            
//            VStack(spacing: 8) {
//                Text("No History Yet")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.primary)
//                
//                Text(searchText.isEmpty ?
//                     "Your color analysis results will appear here" :
//                     "No results found for '\(searchText)'"
//                )
//                .font(.body)
//                .foregroundColor(.secondary)
//                .multilineTextAlignment(.center)
//            }
//            
//            Spacer()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
//
//
//// Extension untuk HistoryManager
//extension HistoryManager {
//    func clearAllResults() {
//        results.removeAll()
//        saveResults()
//    }
//}
//
//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        let historyManager = HistoryManager()
//        
//        // Add sample data with different months
//        let calendar = Calendar.current
//        historyManager.results = [
//            // March
//            ColorResult(result: "Winter", confidence: 0.92, timestamp: Date()),
//            ColorResult(result: "Winter", confidence: 0.85, timestamp: calendar.date(byAdding: .day, value: -1, to: Date()) ?? Date()),
//            ColorResult(result: "Winter", confidence: 0.78, timestamp: calendar.date(byAdding: .day, value: -3, to: Date()) ?? Date()),
//            
//            // February
//            ColorResult(result: "Winter", confidence: 0.88, timestamp: calendar.date(byAdding: .month, value: -1, to: Date()) ?? Date()),
//            ColorResult(result: "Winter", confidence: 0.82, timestamp: calendar.date(byAdding: .day, value: -5, to: calendar.date(byAdding: .month, value: -1, to: Date()) ?? Date()) ?? Date()),
//            ColorResult(result: "Winter", confidence: 0.90, timestamp: calendar.date(byAdding: .day, value: -10, to: calendar.date(byAdding: .month, value: -1, to: Date()) ?? Date()) ?? Date()),
//            
//            // January
//            ColorResult(result: "Winter", confidence: 0.75, timestamp: calendar.date(byAdding: .month, value: -2, to: Date()) ?? Date())
//        ]
//        
//        return HistoryView()
//            .environmentObject(historyManager)
//    }
//}
