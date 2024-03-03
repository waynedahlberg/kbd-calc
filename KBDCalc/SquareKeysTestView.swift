//
//  SquareKeysTestView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct SquareKeysTestView: View {
  var body: some View {
    ZStack {
      Color(.black).edgesIgnoringSafeArea(.all)
      
      GeometryReader { proxy in // whole screen is here
        VStack(spacing: 0) {
          Rectangle()
            .fill(.gray)
            .overlay {
              GeometryReader { geo in
                Text("\(String(format: "%.0f", geo.size.width))" + "  ✕  " + "\(String(format: "%.0f", geo.size.height))")
                  .position(x: geo.size.width / 2, y: geo.size.height / 2)
              }
            }
          Spacer()
          ForEach(0 ..< 5) { row in
            HStack(spacing: 0) {
              ForEach(0..<4, id:\.self) { rect in
                RoundedRectangle(cornerRadius: 13.33, style: .continuous)
                  .fill(randomColor())
                  .frame(width: UIDevice.isTablet
                         ? 128
                         : proxy.size.width / 4,
                         height: UIDevice.isTablet
                         ? 128
                         : proxy.size.width / 4, alignment: .center)
                  .overlay {
                    Text("\(String(format: "%.0f", proxy.size.width / 4))")
                      .foregroundStyle(.black)
                  }
              }
            }
          }
        }
//        .border(.yellow)
        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
      }
    }
  }
  
  private func randomColor() -> Color {
    let colors: [Color] = [
      .red, .pink, .purple, .indigo, .blue, .cyan, .mint, .green, .yellow, .orange
    ]
    return colors.randomElement() ?? .red
  }
}

#Preview("Hello") {
  SquareKeysTestView()
}

