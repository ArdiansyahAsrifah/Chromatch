//
//  SeasonalItemView.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 10/06/25.
//

import SwiftUI

struct SeasonalItemView: View {
    var imageName: String
    var seasonName: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .foregroundColor(color)
                .frame(height: 150)
            
            Text(seasonName)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
    }
}
