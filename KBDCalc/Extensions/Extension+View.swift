//
//  Extension+View.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

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
