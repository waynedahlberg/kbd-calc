//
//  TextGlowView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct LDCGlowView: View {
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      Text("Hello")
        .foregroundStyle(.green)
        .fontWeight(.light)
        .font(.custom("Seven Segment", size: 100))
        .fontDesign(.monospaced)
    }
    
  }
}

#Preview {
  LDCGlowView()
}
