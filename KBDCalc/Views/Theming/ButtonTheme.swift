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
}

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
}



