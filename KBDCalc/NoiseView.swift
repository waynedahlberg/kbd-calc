//
//  NoiseView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/8/24.
//

import SwiftUI

struct NoiseView: View {
  var body: some View {
    Image("macaw")
      .resizable()
      .frame(width: 300, height: 300, alignment: .center)
      .mask {
        RoundedRectangle(cornerRadius: 13.33, style: .continuous)
      }
  }
}

#Preview {
  NoiseView()
}



// MARK: - ViewModifiers

extension View {
  
  func randomNoiseShader() -> some View {
    modifier(RandomNoiseShader())
  }
  
  func perlinNoiseShader() -> some View {
    modifier(PerlinNoiseShader())
  }
}

struct RandomNoiseShader: ViewModifier {
  
  let startDate = Date()
  
  func body(content: Content) -> some View {
    TimelineView(.animation) { _ in
      content
        .colorEffect(
          ShaderLibrary.randomNoise(
            .float(startDate.timeIntervalSinceNow)
          )
        )
    }
  }
}

struct PerlinNoiseShader: ViewModifier {
  
  func body(content: Content) -> some View {
    content.visualEffect { content, proxy in
      content
        .colorEffect(
          ShaderLibrary.perlinNoise(
            .float2(proxy.size)
          )
        )
    }
  }
}
