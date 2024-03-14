//
//  PixellatedView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/8/24.
//

import SwiftUI

struct PixellatedView: View {
  var body: some View {
    Image("macaw")
      .resizable()
      .frame(width: 300, height: 300, alignment: .center)
      .pixellateShader(pixelSize: 8)
      .mask {
        RoundedRectangle(cornerRadius: 13.33, style: .continuous)
          .frame(width: 295, height: 295, alignment: .center)
      }
  }
}

#Preview {
    PixellatedView()
}

extension View {
  func pixellateShader(pixelSize: Float = 8) -> some View {
    modifier(PixellateShader(pixelSize: pixelSize))
  }
}

struct PixellateShader: ViewModifier {
  let pixelSize: Float
  let startDate = Date()
  
  func body(content: Content) -> some View {
    TimelineView(.animation) { _ in
      content
        .layerEffect(ShaderLibrary.pixellate(
          .float(pixelSize),
          .float(startDate.timeIntervalSinceNow)
        ), maxSampleOffset: .zero)
    }
  }
}
