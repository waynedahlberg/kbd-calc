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
    Gradient.Stop(color: Color.black.opacity(0.3), location: 0.0),
    Gradient.Stop(color: Color(hex: "#8295EF").opacity(0.10), location: 0.4),
    Gradient.Stop(color: Color(hex: "#949FD2").opacity(0.10), location: 0.859),
    Gradient.Stop(color: Color.clear, location: 0.89),
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
          ZStack(alignment: .trailing) {
            Text("88888888888")
              .foregroundStyle(.cyan.opacity(0.1))
              .font(.custom("DSEG7Classic-Regular", size: smallFontSize))
            Text("hello")
              .foregroundStyle(.white)
              .font(.custom("DSEG7Classic-Regular", size: smallFontSize))
              .glow(color: .ledblue, radius: 24, opacity: 0.85)
          }
        }
        
        HStack {
          Spacer()
          ZStack(alignment: .trailing) {
            Text("888888888.")
              .foregroundStyle(.cyan.opacity(0.1))
              .font(.custom("DSEG7Classic-Regular", size: largeFontSize))
            Text("3.141592")
              .foregroundStyle(.white)
              .font(.custom("DSEG7Classic-Regular", size: largeFontSize))
              .glow(color: .ledblue, radius: 13, opacity: 0.5)
          }
        }
      }
      .padding(.trailing, 16.0)
      .padding(.bottom, 20)
      .overlay {
        HexagonGridView(rows: 60, columns: 108, hexagonSize: 4, strokeColor: .black)
          .blendMode(.sourceAtop)
          .opacity(0.5)
      }
      //      .background {
      //        RoundedRectangle(cornerRadius: 7.33, style: .continuous)
      //          .fill(screenGradient2)
      //          .stroke(.coolBlue.opacity(0.25), lineWidth: 1.0)
      //          .padding(4)
      //      }
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
