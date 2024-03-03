//
//  SquareKeysTestView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct SquareKeysTestView: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  var body: some View {
    ZStack {
      Color(.black).edgesIgnoringSafeArea(.all)
      
      GeometryReader { proxy in // whole screen is here
        VStack(spacing: 0) {
          ZStack {
            RoundedRectangle(cornerRadius: 13.33, style: .continuous)
              .fill(.gray.opacity(0.15))
              .ignoresSafeArea(edges: [.top, .bottom])
              .overlay {
                GeometryReader { geo in
                  Text("\(String(format: "%.0f", geo.size.width))" + "  ✕  " + "\(String(format: "%.0f", geo.size.height))")
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                }
              }
            
            VStack {
              Spacer()
              
              RoundedRectangle(cornerRadius: 13.33, style: .continuous)
                .fill(.red)
                .aspectRatio(2.19, contentMode: .fit)
                .frame(width: proxy.size.width)
            }
          }
          
          Spacer() // if needed?
          
          ForEach(0 ..< 5) { row in
            HStack(spacing: 0) {
              ForEach(0..<4, id:\.self) { rect in
                RoundedRectangle(cornerRadius: 13.33, style: .continuous)
                  .fill(randomColor())
                  .frame(width: horizontalSizeClass == .compact ? proxy.size.width / 4 : 128,
                         height: horizontalSizeClass == .compact ? proxy.size.width / 4 : 128,
                         alignment: .center)
//                  .frame(width: UIDevice.isTablet || horizontalSizeClass != .compact
//                         ? 128
//                         : proxy.size.width / 4,
//                         height: UIDevice.isTablet || horizontalSizeClass != .compact
//                         ? 128
//                         : proxy.size.width / 4, alignment: .center)
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

