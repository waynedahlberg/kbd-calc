//
//  DisplayTheme.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

/// Computation View theme
///
enum DisplayTheme: String {
  case basic
  case dark
  case light
  
  var digitColor: Color {
    switch self {
    case .basic:        return .cyan
    case .dark:         return .white
    case .light:        return .black
    }
  }
  
    var backgroundColor: Color {
      switch self {
      case .basic:        return .purple
      case .dark:         return .black
      case .light:        return .white
      }
    }
  
  // Can be ANY view, not just these Colors
  @ViewBuilder var backgroundView: some View {
    switch self {
    case .basic:
      Color.blue
    case .dark:
      Color.black
    case .light:
      Color.white
    }
  }
  
  var displayFont: String {
    switch self {
    case .basic:
      return "BasicFontName"
    case .dark:
      return "DarkFontName"
    case .light:
      return "LightFontName"
    }
  }
}
