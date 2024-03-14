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
  
  let keypadMargin: CGFloat = 16
  let gridSpacing: CGFloat = 4
  
  let svgData: [[String]] = [
    ["clear", "negative", "percentage", "divide"],
    ["number-7", "number-8", "number-9", "multiply"],
    ["number-4", "number-5", "number-6", "minus"],
    ["number-1", "number-2", "number-3", "plus"],
    ["undo", "number-0", "decimal", "equal"]
  ]
  
  let charData: [[String]] = [
    ["AC", "+/-", "%", "/"],
    ["7", "8", "9", "X"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["←", "0", ".", "=z"]
  ]
  
  let keyColor: [[Color]] = [
    [.clear, .clear, .clear, .clear],
    [.clear, .clear, .clear, .clear],
    [.clear, .clear, .clear, .clear],
    [.clear, .clear, .clear, .clear],
    [.clear, .clear, .clear, .clear]
  ]
  
  let charColor: [[Color]] = [
    [.clearBlue, .op1Gray, .op1Gray, .op1Gray],
    [.black, .black, .black, .op1Gray],
    [.black, .black, .black, .op1Gray],
    [.black, .black, .black, .op1Gray],
    [.red, .black, .op1Gray, .op1Gray]
  ]
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color.black)
        .edgesIgnoringSafeArea(.all)
      
      GeometryReader { proxy in // whole screen is here
        VStack(spacing: gridSpacing) {
          ZStack {
            RoundedRectangle(cornerRadius: 13.33, style: .continuous)
              .fill(.black)
              .ignoresSafeArea(edges: [.top, .bottom])
//              .overlay {
//                GeometryReader { geo in
//                  // Just for testing, prints out the dimensions of the Geometry Proxy
//                  Text("\(String(format: "%.0f", geo.size.width))" + "  ✕  " + "\(String(format: "%.0f", geo.size.height))")
//                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
//                }
//              }
            VStack {
              Spacer()
              BlueDisplayTheme(
                largeFontSize: UIDevice.isTablet ? 64 : 44,
                smallFontSize: UIDevice.isTablet ? 24 : 16, resultText: "0.", computeText: "_")
              .aspectRatio(2.32, contentMode: .fit)
              .frame(width: proxy.size.width)
            }
            .border(.yellow)
          }
          
          Spacer() // if needed?
          
          ForEach(0..<5, id:\.self) { row in
            HStack(spacing: gridSpacing) {
              ForEach(0..<4, id:\.self) { rect in
                let character = svgData[row][rect]
                let charColor = charColor[row][rect]
                let keyColor = keyColor[row][rect]
                Button(action: {
                  print("b")
                  Haptics.shared.play(.light)
                }, label: {
                  OP1ButtonView(charString: character,
                                charColor: charColor,
                                keyColor: keyColor)
                  .frame(width: horizontalSizeClass == .compact ? (proxy.size.width - keypadMargin) / 4 : 128,
                         height: horizontalSizeClass == .compact ? (proxy.size.width - keypadMargin) / 4 : 128,
                         alignment: .center)
                })
                .buttonStyle(CalcButtonStyle())
              }
            }
          }
        }
        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
      }
    }
    .statusBarHidden()
    .preferredColorScheme(.dark)
    .persistentSystemOverlays(.hidden)
  }
  
  private func randomColor() -> Color {
    let colors: [Color] = [
      .red, .pink, .purple, .indigo, .blue, .cyan, .mint, .green, .yellow, .orange
    ]
    return colors.randomElement() ?? .red
  }
}

#Preview {
  SquareKeysTestView()
}

