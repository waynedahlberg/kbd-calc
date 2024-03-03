//
//  TextGlowView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct LEDGlowView: View {
  var fontSize: CGFloat
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      HStack {
        Spacer()
        Text("3.14159")
      }
      .padding(.trailing, 16.0)
      .foregroundStyle(.white)
      .font(.custom("Seven Segment", size: fontSize))
      .glow(color: .ledgreen, radius: 13, opacity: 0.5)
      
    }
    
  }
}

#Preview {
  LEDGlowView(fontSize: 64)
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
