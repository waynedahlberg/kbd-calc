//
//  MetalModifiers.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

extension View {
  func bloom() -> some View {
    modifier(BloomShader())
  }
  
  func rainbow() -> some View {
    modifier(RainbowShader())
  }
}

struct BloomShader: ViewModifier {
  func body(content: Content) -> some View {
    content.visualEffect { content, proxy in
      content
        .colorEffect(
          ShaderLibrary.bloomShader(
            .float2(proxy.size)
          )
        )
    }
  }
}

struct RainbowShader: ViewModifier {
  func body(content: Content) -> some View {
    content.visualEffect { content, proxy in
      content
        .colorEffect(
          ShaderLibrary.rainbow(.float2(proxy.size))
        )
    }
  }
}
