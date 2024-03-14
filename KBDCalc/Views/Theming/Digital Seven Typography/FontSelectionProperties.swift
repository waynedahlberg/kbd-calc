//
//  FontSelectionProperties.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

enum FontWeight: String, CaseIterable, Identifiable {
  case light = "Light"
  case regular = "Regular"
  case bold = "Bold"
  
  var id: String { self.rawValue }
}

enum FontColor: String, CaseIterable, Identifiable {
  case red = "Red"
  case green = "Green"
  case blue = "Blue"
  
  var id: String { self.rawValue }
}

struct FontSelectionProperties {
  var isDSEG14: Bool = false
  var isItalic: Bool = false
  var fontWeight: FontWeight = .regular
  var isClassicMini: Bool = false
  var fontColor: FontColor = .red
  var glowIntensity: Double = 0.0 // no glow
  
  func selectedFontName() -> String {
    var fontName = isDSEG14 ? "DSEG14" : "DSEG7"
    fontName += isClassicMini ? "ClassicMini" : "Classic"
    
    if isItalic {
      switch fontWeight {
      case .bold:
        fontName += "-BoldItalic"
      case .light:
        fontName += "-LightItalic"
      default:
        fontName += "-Italic"
      }
    } else {
      fontName += "-\(fontWeight.rawValue)"
    }
    
    return fontName
  }
}

struct GlowModifier: ViewModifier {
  var color: Color
  var intensity: Double
  
  func body(content: Content) -> some View {
    content
      .shadow(color: color, radius: intensity, x: 0, y: 0)
      .shadow(color: color, radius: intensity, x: 0, y: 0)
      .shadow(color: color, radius: intensity, x: 0, y: 0)
  }
}

extension View {
  func glow(color: Color = .white, intensity: Double) -> some View {
    self.modifier(GlowModifier(color: color, intensity: intensity))
  }
}
