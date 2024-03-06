//
//  ButtonView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct ButtonView: View {
  @Environment(\.mainWindowSize) var windowSize
  
  let calcButton: CalcButton
  let fgColor: Color
  let bgColor: Color
  
  // For SF Symbols
  var systemImage: String? {
    let value = calcButton.rawValue
    return value.contains("SVG") ? value.replacingOccurrences(of: "SVG", with: "") : nil
  }
  
  // For SVG images
  var svgImage: String? {
    let value = calcButton.displayValue
    return value.contains("SVG") ? value.replacingOccurrences(of: "SVG", with: "") : nil
  }
  
  var text: String? {
    let value = calcButton.rawValue
    return value.contains("SVG") ? nil : value
  }
    
  let buttonDim: CGFloat = UIDevice.isTablet ? UIScreen.main.bounds.width / 5 : UIScreen.main.bounds.width / 5
  
  var body: some View {
    ZStack {
      Image("\(String(describing: svgImage ?? ""))")
    }
    .font(UIDevice.isTablet ? .largeTitle : .title2)
    .fontWeight(UIDevice.isTablet ? .bold : .semibold)
    .frame(width: buttonDim, height: buttonDim)
    .foregroundColor(fgColor)
    .background(bgColor)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(color: bgColor.opacity(0.5), radius: 5, x: 5, y: 5)
  }
}

#Preview {
  VStack {
    ButtonView(calcButton: .decimal, fgColor: .foregroundDigits, bgColor: .secondaryBG)
    
    ButtonView(calcButton: .undo, fgColor: .foregroundDigits, bgColor: .secondaryBG)
    
    ButtonView(calcButton: .divide, fgColor: .foregroundDigits, bgColor: .secondaryBG)
    
    ButtonView(calcButton: .five, fgColor: .foregroundDigits, bgColor: .secondaryBG)
    
    ButtonView(calcButton: .multiply, fgColor: .foregroundDigits, bgColor: .secondaryBG)
  }
}
