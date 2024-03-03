//
//  KeyboardLayout1.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct KeyboardLayout1: View {
  @Environment(\.mainWindowSize) var windowsSize
  
  let keypad: [[String]] = [
    [CalcButton.one.rawValue]
  ]
  
  var body: some View {
    VStack(spacing: 2) {
      HStack(spacing:2) {
        NumeralButton(fgColor: .white, bgColor: .gray, char: CalcButton.negative.rawValue)
        NumeralButton(fgColor: .white, bgColor: .gray, char: CalcButton.openParen.rawValue)
        NumeralButton(fgColor: .white, bgColor: .gray, char: CalcButton.closeParen.rawValue)
        NumeralButton(fgColor: .white, bgColor: .gray, char: CalcButton.star.rawValue)
      }
      HStack(spacing:2) {
        NumeralButton(fgColor: .black, bgColor: .white, char: "7")
        NumeralButton(fgColor: .black, bgColor: .white, char: "8")
        NumeralButton(fgColor: .black, bgColor: .white, char: "9")
        NumeralButton(fgColor: .white, bgColor: .blue, char: "÷")
      }
      HStack(spacing:2) {
        NumeralButton(fgColor: .black, bgColor: .white, char: "4")
        NumeralButton(fgColor: .black, bgColor: .white, char: "5")
        NumeralButton(fgColor: .black, bgColor: .white, char: "6")
        NumeralButton(fgColor: .white, bgColor: .blue, char: "*")
      }
      HStack(spacing:2) {
        NumeralButton(fgColor: .black, bgColor: .white, char: "1")
        NumeralButton(fgColor: .black, bgColor: .white, char: "2")
        NumeralButton(fgColor: .black, bgColor: .white, char: "3")
        NumeralButton(fgColor: .white, bgColor: .blue, char: "-")
      }
      HStack(spacing:2) {
        NumeralButton(fgColor: .black, bgColor: .white, char: "7")
        NumeralButton(fgColor: .black, bgColor: .white, char: "8")
        NumeralButton(fgColor: .black, bgColor: .white, char: "9")
        NumeralButton(fgColor: .white, bgColor: .blue, char: "÷")
      }

      HStack(spacing: 2) {
        VStack(spacing: 0) {
          HStack(spacing: 0) {
            NumeralButton(fgColor: .black, bgColor: .white, char: "0")
            NumeralButton(fgColor: .black, bgColor: .white, char: ".")
            NumeralButton(fgColor: .black, bgColor: .white, char: "%")
          }
          HStack(spacing: 0) {
            NumeralButton(fgColor: .white, bgColor: .red, char: "⇐")
            NumeralButton(fgColor: .white, bgColor: .orange, char: "=")
          }
        }
        HStack {
          NumeralButton(fgColor: .white, bgColor: .blue, char: "+")
        }
      }
    }
    .background(Color.black)
  }
}

#Preview {
  KeyboardLayout1()
}


struct NumeralButton: View {
  @Environment(\.mainWindowSize) var windowSize
  
  var fgColor: Color
  var bgColor: Color
  var char: String
    
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Color(bgColor)
        
        Button(action: {
          // action
        }, label: {
          Text(char)
            .font(.title2)
            .foregroundStyle(fgColor)
            .fontWeight(.bold)
            .fontDesign(.rounded)
        })
      }
    }
  }
}
