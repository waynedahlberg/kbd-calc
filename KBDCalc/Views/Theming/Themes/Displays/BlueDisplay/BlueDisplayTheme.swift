//
//  BlueDisplayTheme.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

struct BlueDisplayTheme: View {
  // Font size values
  var largeFontSize: CGFloat
  var smallFontSize: CGFloat
  
  let screenGradient2 = LinearGradient(stops: [
    Gradient.Stop(color: Color.black.opacity(0.3), location: 0.0),
    Gradient.Stop(color: Color(hex: "#8295EF").opacity(0.10), location: 0.4),
    Gradient.Stop(color: Color(hex: "#949FD2").opacity(0.10), location: 0.859),
    Gradient.Stop(color: .clear, location: 0.89),
    Gradient.Stop(color: .clear, location: 1.0)
  ], startPoint: .top, endPoint: .bottom)
  
  let screenGradient1 = LinearGradient(colors: [
    Color(.black),
    Color(.blue.opacity(0.15))
  ], startPoint: .top, endPoint: .bottom)
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack(alignment: .trailing, spacing: 16) {
        HStack {
          Spacer()
          ZStack(alignment: .trailing) {
            Text("8888888888.")
              .foregroundStyle(.cyan.opacity(0.1))
              .font(.custom("DSEG7Classic-Regular", size: largeFontSize))
            Text("3.1415927")
              .foregroundStyle(.white)
              .font(.custom("DSEG7Classic-Regular", size: largeFontSize))
              .glow(color: .ledblue, radius: 13, opacity: 0.5)
          }
        }

        HStack {
          ZStack(alignment: .trailing) {
            Text("88888888888")
              .foregroundStyle(.cyan.opacity(0.1))
              .font(.custom("DSEG7Classic-Regular", size: smallFontSize))
            Text("3 x 8")
              .foregroundStyle(.white)
              .font(.custom("DSEG7Classic-Regular", size: smallFontSize))
              .glow(color: .ledblue, radius: 24, opacity: 0.85)
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
    }
  }
}

#Preview {
  BlueDisplayTheme(largeFontSize: 32, smallFontSize: 16)
}
