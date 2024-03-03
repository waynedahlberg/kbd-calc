//
//  LCDGlow.metal
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>

using namespace metal;

float glow(float x, float str, float dist) {
  return dist / pow(x, str);
}

//[[ stitchable ]] bloom(float2 pos, half4 color) {
//  float2 st = (
//}
//
