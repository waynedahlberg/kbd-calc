//
//  ComputationView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct ComputationView: View {
  @Binding var currentDisplayTheme: DisplayTheme
  
  let currentComputation: String
  let mainResult: String
  
  var body: some View {
    VStack(alignment: .trailing, spacing: 10) {
      HStack {
        Spacer()
        Text(mainResult)
          .foregroundStyle(currentDisplayTheme.digitColor)
          .font(.largeTitle)
          .fontWeight(.semibold)
          .lineLimit(1)
          .background(currentDisplayTheme.backgroundColor)
      }
      .minimumScaleFactor(0.1)

      HStack {
        Spacer()
        Text(currentComputation)
          .foregroundStyle(currentDisplayTheme.digitColor)
          .font(UIDevice.isTablet ? .largeTitle : .title2)
          .lineLimit(1)
          .background(currentDisplayTheme.backgroundColor)
          .padding(.trailing, 4)
      }
      .minimumScaleFactor(0.1)

    }
    .padding(.horizontal)
  }
}

#Preview {
  ComputationView(currentDisplayTheme: .constant(DisplayTheme.basic), currentComputation: "11 + 12", mainResult: "23")
}
