// HistoryView.swift
// Chromatch
//
// Created by Muhammad Ardiansyah Asrifah on 14/06/25.


import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyManager: HistoryManager
    
    @State private var showingDeleteSingleItemAlert = false
    @State private var showingClearAllAlert = false
    
    @State private var itemToDelete: ColorResult?
    @State private var selectedMonthFilter: String = "All"
    @Binding var isActive: Bool
    @Binding var selectedTab: AppTab
    let imageData: Data?

    var filteredResults: [ColorResult] {
        if selectedMonthFilter == "All" {
            return historyManager.results
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            return historyManager.results.filter { result in
                formatter.string(from: result.timestamp) == selectedMonthFilter
            }
        }
    }

    var groupedResults: [MonthGroup] {
        let grouped = Dictionary(grouping: filteredResults) { result in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            return formatter.string(from: result.timestamp)
        }
        return grouped
            .map { (monthName, results) in
                MonthGroup(id: monthName, results: results.sorted { $0.timestamp > $1.timestamp })
            }
            .sorted {
                guard let firstDate = $0.results.first?.timestamp, let secondDate = $1.results.first?.timestamp else {
                    return false
                }
                return firstDate > secondDate
            }
    }

    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.activeBTEnd)
                .opacity(0.2)

            VStack(spacing: 0) {
                Spacer(minLength: 50)
                headerView

                if filteredResults.isEmpty {
                    emptyStateView
                } else {
                    ScrollView {
                        LazyVStack(spacing: 24) {
                            ForEach(groupedResults) { monthGroup in
                                MonthSectionView(
                                    monthName: monthGroup.monthName,
                                    results: monthGroup.results,
                                    onDelete: { result in
                                        itemToDelete = result
                                        showingDeleteSingleItemAlert = true
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 100)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .alert("Delete Result", isPresented: $showingDeleteSingleItemAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                if let item = itemToDelete {
                    withAnimation(.spring()) {
                        historyManager.removeResult(item)
                    }
                }
            }
        }
    }

    private var headerView: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                if !historyManager.results.isEmpty {
                    Button("Clear All") {
                        showingClearAllAlert = true
                    }
                    .foregroundColor(.red)
                    .font(.system(size: 16, weight: .medium))
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .alert("Delete All History?", isPresented: $showingClearAllAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete All", role: .destructive) {
                withAnimation(.spring()) {
                    historyManager.clearAllResults()
                }
            }
        } message: {
            Text("This action will permanently delete all your color analysis results.")
        }
    }


    private var emptyStateView: some View {
        VStack(alignment: .leading, spacing: 20) {
            (
                Text("Ready to unlock the colors that were made for you?\n\nLet's start with a ")
                + Text("selfie").bold()
                
                )
            //Subject to Change
              .font(.custom("Urbanist-Regular", size: 20))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, alignment: .top)
              .padding(.horizontal, 30)
              .padding(.top, -80)
              .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
