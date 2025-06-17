//
//  Month.swift
//  Chromatch
//
//  Created by Hafi on 17/06/25.
//

struct MonthGroup: Identifiable {
    // The id will be the month's name, which is unique among the groups.
    let id: String
    let results: [ColorResult]
    
    // A helper to get the name easily
    var monthName: String { id }
}
