//
//  FontSelectionProperties.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

enum FontWeight: String, CaseIterable, Identifiable {
  case bold = "Bold"
  case regular = "Regular"
  case light = "Light"
  
  var id: String { self.rawValue }
}

struct FontSelectionProperties {
  var isDSEG14: Bool = false
  var isItalic: Bool = false
  var fontWeight: FontWeight = .regular
  var isClassicMini: Bool = false
  
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


