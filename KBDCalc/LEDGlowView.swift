//
//  TextGlowView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct LEDGlowView: View {
  var largeFontSize: CGFloat
  var smallFontSize: CGFloat
  
  let screenGradient2 = LinearGradient(stops: [
    Gradient.Stop(color: Color.black.opacity(0.60), location: 0.0),
    Gradient.Stop(color: Color(hex: "#8295EF").opacity(0.10), location: 0.4),
    Gradient.Stop(color: Color(hex: "#949FD2").opacity(0.16), location: 0.699),
    Gradient.Stop(color: Color.clear, location: 0.70),
    Gradient.Stop(color: Color.clear, location: 1.0)
  ],
                                       startPoint: .top,
                                       endPoint: .bottom)
  
  let screenGradient1 = LinearGradient(colors: [
    Color(.black),
    Color(.blue.opacity(0.15))
  ], startPoint: .top, endPoint: .bottom)
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 16) {
        Spacer()
        HStack {
          Spacer()
          Text("123 ✕ 321 ÷ 16")
            .foregroundStyle(.white)
            .font(.custom("DSEG7Classic-Regular", size: smallFontSize))
            .glow(color: .ledblue, radius: 13, opacity: 0.5)
        }
        HStack {
          Spacer()
          Text("3.141592")
        }
        .foregroundStyle(.white)
        .font(.custom("DSEG7Classic-Regular", size: largeFontSize))
        .glow(color: .ledblue, radius: 13, opacity: 0.5)
      }
      .padding(.trailing, 16.0)
      .padding(.bottom, 20)
      .background {
        RoundedRectangle(cornerRadius: 7.33, style: .continuous)
          .fill(screenGradient2)
          .stroke(.coolBlue.opacity(0.3), lineWidth: 1.0)
          .padding(4)
      }
    }
    
  }
}

#Preview {
  LEDGlowView(largeFontSize: 32, smallFontSize: 16)
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
