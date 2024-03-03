//
//  ComputationView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct ComputationView: View {
  let currentComputation: String
  let mainResult: String
  
  var body: some View {
    VStack(alignment: .trailing, spacing: 10) {
      HStack {
        Spacer()
        Text(mainResult)
          .foregroundStyle(.foregroundDigits)
          .font(.largeTitle)
          .fontWeight(.semibold)
          .lineLimit(1)
      }
      .minimumScaleFactor(0.1)
      
      HStack {
        Spacer()
        Text(currentComputation)
          .foregroundStyle(.foregroundDigits)
          .font(UIDevice.isTablet ? .largeTitle : .body)
          .lineLimit(1)
      }
      .minimumScaleFactor(0.1)
      
      
    }
    .padding(.horizontal)
  }
}

#Preview {
  ComputationView(currentComputation: "11 + 12", mainResult: "23")
}
