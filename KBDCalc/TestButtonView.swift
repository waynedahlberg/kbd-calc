//
//  TestButtonView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/13/24.
//

import SwiftUI

struct TestButtonView: View {
  var spacerConstant: CGFloat = 8
  
  
  var body: some View {
    GeometryReader { proxy in
      HStack(spacing: spacerConstant) {
        ForEach(0..<4, id:\.self) { button in
          OP1ButtonView(charString: "W", charColor: .black, keyColor: .white)
            .frame(width: proxy.size.width / 4, height: proxy.size.width / 4)
        }
      }
    }
    
  }
}

#Preview {
  TestButtonView()
}
