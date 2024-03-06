//
//  ButtonTheme.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

/// Button theme
///
enum ButtonTheme: String {
  case classic
  case modern
  case neon
  
  var digitColor: Color {
    switch self {
    case .classic:      return .blue
    case .modern:       return .green
    case .neon:         return .pink
    }
  }
  
  var keyColor: Color {
    switch self {
    case .classic:      return .white
    case .modern:       return .yellow
    case .neon:         return .purple
    }
  }
  
  // Can be ANY view, not just these colors
  @ViewBuilder var keyBackgroundView: some View {
    switch self {
    case .classic:
      Color.yellow
    case .modern:
      Color.white
    case .neon:
      Color.purple
    }
  }
  
  var keyFont: String {
    switch self {
    case .classic:
      return "ClassicFontName"
    case .modern:
      return "ModernFontName"
    case .neon:
      return "NeonFontName"
    }
  }
}




