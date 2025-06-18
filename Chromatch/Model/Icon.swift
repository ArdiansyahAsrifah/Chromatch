//
//  Icon.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI


func getSeasonalIcon(result: String) -> some View{
    switch result.lowercased() {
    case "spring":
        return Image("Spring")

    case "summer":
        return Image("Summer")
        
    case "autumn", "fall":
        return Image("Autumn")
        
    case "winter":
        return Image("Winter")
        
    default:
        return Image("Default")
    }
}
