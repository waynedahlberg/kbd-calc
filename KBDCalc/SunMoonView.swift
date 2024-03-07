//
//  SunMoonView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct SunMoonView: View {
  var lightMode: Bool
  
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: "sun.min")
        .imageScale(.large)
        .foregroundStyle(lightMode ? .sunMoonSelected : .sunMoonNotSelected)
      
      Image(systemName: "moon")
        .imageScale(.large)
        .foregroundColor(lightMode ? .sunMoonNotSelected : .sunMoonSelected)
    }
    .font(UIDevice.isTablet ? .largeTitle : .body)
    .fontWeight(UIDevice.isTablet ? .semibold : .regular)
    .padding()
    .background(.secondaryBG)
    .cornerRadius(20)
  }
}

#Preview {
  VStack {
    SunMoonView(lightMode: false)
    SunMoonView(lightMode: true)
  }
}
