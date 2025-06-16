//
//  ResultDetailSubview.swift
//  Chromatch
//
//  Created by Felda Everyl on 14/06/25.
//

import SwiftUI


//struct CustomNavigationBar: View {
//    var onBack: () -> Void
//
//    var body: some View {
//        HStack {
//            Button(action: onBack) {
//                ZStack {
//                    Circle()
//                        .fill(Color.white.opacity(0.9))
//                        .frame(width: 40, height: 40)
//
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 18, weight: .medium))
//                        .foregroundColor(.black)
//                }
//            }
//
//            Spacer()
//
//            Text("Result")
//                .font(.system(size: 18, weight: .semibold))
//                .foregroundColor(.black.opacity(0.8))
//                .padding(.horizontal, 20)
//                .padding(.vertical, 8)
//                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.9)))
//
//            Spacer()
//
//            Circle()
//                .fill(Color.clear)
//                .frame(width: 40, height: 40)
//        }
//        .padding(.horizontal, 20)
//        .padding(.top, 10)
//    }
//}

struct ProfileHeaderView: View {
    var result: String
    var confidence: Float
    var animate: Bool
    var progressValue: Float

    var body: some View {
        HStack {
            ZStack {
                Circle().fill(Color.gray.opacity(0.3)).frame(width: 80, height: 80)
                Image(systemName: "person.fill").font(.system(size: 35)).foregroundColor(.gray.opacity(0.7))
            }
            .scaleEffect(animate ? 1.0 : 0.8)
            .opacity(animate ? 1.0 : 0.0)

            Spacer()

            VStack(alignment: .trailing) {
                Text("Accuracy")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black.opacity(0.6))

                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 6)
                        .frame(width: 60, height: 60)

                    Circle()
                        .trim(from: 0, to: CGFloat(progressValue))
                        .stroke(
                            LinearGradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing),
                            style: StrokeStyle(lineWidth: 6, lineCap: .round)
                        )
                        .frame(width: 60, height: 60)
                        .rotationEffect(.degrees(-90))

                    Text("\(Int(progressValue * 100))%")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(.black.opacity(0.8))
                }
            }
            .scaleEffect(animate ? 1.0 : 0.8)
            .opacity(animate ? 1.0 : 0.0)
        }
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}

struct SeasonInfoView: View {
    var result: String
    var animate: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(result)
                .font(.system(size: 48, weight: .light))
                .foregroundColor(.black.opacity(0.9))
                .opacity(animate ? 1.0 : 0.0)
                .offset(x: animate ? 0 : -30)

            Text(getSeasonDescription(result: result))
                .font(.system(size: 16))
                .foregroundColor(.black.opacity(0.7))
                .opacity(animate ? 1.0 : 0.0)
                .offset(x: animate ? 0 : -30)
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
}

struct PaletteView: View {
    var result: String
    var animate: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Your Palette")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black.opacity(0.9))
                    .padding(.top, 15)
                Spacer()
            }

            let colors = getRecommendedColorsWithNames(result: result)

            VStack(spacing: 12) {
                ForEach(0..<2) { row in
                    HStack(spacing: 12) {
                        ForEach(0..<2) { col in
                            let index = row * 2 + col
                            if index < colors.count {
                                let colorInfo = colors[index]
                                VStack(alignment: .leading, spacing: 8) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(colorInfo.color)
                                        .frame(height: 100)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(colorInfo.name)
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.black.opacity(0.8))

                                        Text(colorInfo.hex)
                                            .font(.system(size: 12, design: .monospaced))
                                            .foregroundColor(.black.opacity(0.5))
                                    }
                                }
                                .scaleEffect(animate ? 1.0 : 0.9)
                                .opacity(animate ? 1.0 : 0.0)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

struct SeasonalTwinsView: View {
    var result: String
    var animate: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Seasonal Twins")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black.opacity(0.9))

            HStack(spacing: 20) {
                ForEach(0..<3) { index in
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 80)
                            Image(systemName: "person.fill")
                                .font(.system(size: 35))
                                .foregroundColor(.gray.opacity(0.7))
                        }
                        .scaleEffect(animate ? 1.0 : 0.8)
                        .opacity(animate ? 1.0 : 0.0)

                        Text(getCelebrityNames(result: result)[index])
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .opacity(animate ? 1.0 : 0.0)
                    }
                    .frame(maxWidth: .infinity) // 🟢 Ensures equal spacing
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

//struct ActionButtonsView: View {
//    var onRetry: () -> Void
//    var onSave: () -> Void
//
//    var body: some View {
//        VStack(spacing: 15) {
//            Button(action: onRetry) {
//                Text("Try Again")
//                    .font(.system(size: 18, weight: .semibold))
//                    .foregroundColor(.black)
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 16)
//                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).stroke(Color.black.opacity(0.1), lineWidth: 1))
//            }
//            .buttonStyle(SpringButtonStyle())
//
//            Button(action: onSave) {
//                Text("Save to Profile")
//                    .font(.system(size: 18, weight: .semibold))
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 16)
//                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.9)))
//            }
//            .buttonStyle(SpringButtonStyle())
//        }
//        .padding(.horizontal, 25)
//        .padding(.bottom, 30)
//    }
//}
