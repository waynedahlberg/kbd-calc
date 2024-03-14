//
//  LCDCalculationView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/13/24.
//

import SwiftUI

struct LCDCalculationView: View {
  var body: some View {
    VStack {
      
      
      LCD1DisplayTheme(largeFontSize: 44, smallFontSize: 16, resultText: "1234.", computeText: "1234_")
        .padding(.horizontal, 12)
        .frame(maxHeight: 128)
        .background {
          RoundedRectangle(cornerRadius: 13.3, style: .continuous)
            .fill(.backgroundLcd)
        }
      
      CalculatorButtonsView(currentComputation: .constant("5 + 17"), mainResult: .constant("22"))
    }
  }
}

#Preview {
  LCDCalculationView()
}
