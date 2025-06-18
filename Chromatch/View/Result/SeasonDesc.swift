//
//  SeasonDesc.swift
//  Chromatch
//
//  Created by Muhammad Ardiansyah Asrifah on 14/06/25.
//

import SwiftUI

struct SeasonTitleAndDescriptionView: View {
    var result: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(result)
                .font(.custom("Urbanist-Regular", size: 48).weight(.medium))
                .foregroundColor(.black.opacity(0.9))
            
            Text(getSeasonDescription(result: result))
                .font(.custom("Urbanist-Regular", size: 16))
                .foregroundColor(.black.opacity(0.7))
        }
    }
}
