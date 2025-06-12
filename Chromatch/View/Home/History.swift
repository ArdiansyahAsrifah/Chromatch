//
//  History.swift
//  Chromatch
//
//  Created by Felda Everyl on 11/06/25.
//

import Foundation
import SwiftUI


func groupByMonth(results: [AnalysisResult]) -> [String: [AnalysisResult]] {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM"
    
    return Dictionary(grouping: results) { formatter.string(from: $0.date) }
}


struct CircularProgressView: View {
    var progress: Double // 0.0 to 1.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .opacity(0.3)
                .foregroundColor(.gray)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center),
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear, value: progress)

            Text("\(Int(progress * 100))%")
                .font(.caption)
                .bold()
        }
        .frame(width: 50, height: 50)
    }
}


import SwiftData

struct HistoryView: View {
    @Query(sort: \AnalysisResult.date, order: .reverse) var results: [AnalysisResult]

    var groupedResults: [String: [AnalysisResult]] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return Dictionary(grouping: results) { formatter.string(from: $0.date) }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(groupedResults.keys.sorted(by: >), id: \.self) { month in
                    VStack(alignment: .leading) {
                        Text(month)
                            .font(.title2)
                            .bold()
                            .padding(.leading)

                        ForEach(groupedResults[month] ?? [], id: \.self) { result in
                            HStack {
                                Image(result.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .shadow(radius: 4)

                                VStack(alignment: .leading) {
                                    Text(result.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(result.season)
                                        .font(.headline)
                                }

                                Spacer()
                                CircularProgressView(progress: result.confidence)
                            }
                            .padding()
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    let modelContainer = try! ModelContainer(for: AnalysisResult.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

    let context = modelContainer.mainContext

    // Sample preview data
    let sampleResults = [
        AnalysisResult(date: Date(), season: "Winter", confidence: 1.0, imageName: "person1"),
        AnalysisResult(date: Date().addingTimeInterval(-86400 * 2), season: "Winter", confidence: 0.72, imageName: "person2"),
        AnalysisResult(date: Date().addingTimeInterval(-86400 * 30), season: "Winter", confidence: 0.56, imageName: "person3")
    ]

    for result in sampleResults {
        context.insert(result)
    }

    return HistoryView()
        .modelContainer(modelContainer)
}
