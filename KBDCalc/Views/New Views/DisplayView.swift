//
//  DisplayView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/13/24.
//

import SwiftUI

enum LedStyle: String {
  case light, regular, bold, compute
  
  var color: String {
    switch self {
    case .light: return "DSEG7Classic-LightItalic"
    case .regular: return "DSEG7ClassicMini-BoldItalic"
    case .bold: return "DSEG7Classic-Regular"
    case .compute: return "DSEG14Classic"
    }
  }
}


struct DisplayView: View {
  
  // Font size values
  var resultText: String
  var computeText: String
  
  let baseResultText: String = "888888888."
  let baseComputeText: String = "\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}"
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack(alignment: .trailing, spacing: 16) {
        HStack {
          Spacer()
          ZStack(alignment: .trailing) {
            Text(baseResultText)
              .led(type: .baseLargeGreen)
            Text(resultText)
              .led(type: .largeGreen)
          }
        }
        
        HStack {
          ZStack(alignment: .trailing) {
            Text(baseComputeText)
              .led(type: .baseSmallGreen)
            Text(computeText)
              .led(type: .smallGreen)
          }
          .onAppear {
            print("\(LEDType.largeRed.style.rawValue)")
          }
        }
      }
    }
  }
}

#Preview {
  DisplayView(resultText: "0.", computeText: "0")
}


struct GhostLEDModifier: ViewModifier {
  var ledType: LEDType
  
  func body(content: Content) -> some View {
    content
      .foregroundStyle(ledType.baseColor.opacity(0.1))
      .font(.custom("DSEG7Classic-LightItalic", size: 44))
//      .font(.custom(ledType.style.rawValue, size: ledType.size.rawValue))
      .glow(color: ledType.isLit ? ledType.baseColor : .clear, radius: ledType.size == .small ? 8 : 5, opacity: ledType.size == .small ? 0.65 : 0.55)
  }
}

extension View {
  func led(type: LEDType) -> some View {
    modifier(GhostLEDModifier(ledType: type))
  }
}

enum SevenSegSize: CGFloat {
  case small = 16
  case large = 44
}

struct LEDType: Identifiable {
  var id = UUID()
  var isLit: Bool
  var size: SevenSegSize
  var baseColor: Color
  var style: LedStyle
  
  static let largeRed = LEDType(isLit: true, size: .large, baseColor: .red, style: .light)
  static let smallRed = LEDType(isLit: true, size: .small, baseColor: .red, style: .compute)
  static let largeGreen = LEDType(isLit: true, size: .large, baseColor: .green, style: .bold)
  static let smallGreen = LEDType(isLit: true, size: .small, baseColor: .green, style: .compute)
  static let largeBlue = LEDType(isLit: true, size: .large, baseColor: .blue, style: .regular)
  static let smallBlue = LEDType(isLit: true, size: .small, baseColor: .blue, style: .compute)
  
  static let baseLargeRed = LEDType(isLit: false, size: .large, baseColor: .red, style: .light)
  static let baseSmallRed = LEDType(isLit: false, size: .small, baseColor: .red, style: .compute)
  static let baseLargeGreen = LEDType(isLit: false, size: .large, baseColor: .green, style: .bold)
  static let baseSmallGreen = LEDType(isLit: false, size: .small, baseColor: .green, style: .compute)
  static let baseLargeBlue = LEDType(isLit: false, size: .large, baseColor: .blue, style: .bold)
  static let baseSmallBlue = LEDType(isLit: false, size: .small, baseColor: .blue, style: .compute)
}

extension View {
  func glow(color: Color = .ledred, radius: CGFloat = 20, opacity: CGFloat = 0.15) -> some View {
    self
      .background(self.blur(radius: radius / 6))
      .shadow(color: color.opacity(opacity), radius: radius / 3)
      .shadow(color: color.opacity(opacity), radius: radius * 6)
      .shadow(color: color.opacity(opacity), radius: radius * 2.5)
      .shadow(color: color.opacity(opacity), radius: radius)
  }
}
