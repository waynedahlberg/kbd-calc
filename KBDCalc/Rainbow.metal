//
//  Rainbow.metal
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>

using namespace metal;

[[ stitchable ]] half4 sizeAwareColor(float2 position, half4 color, float2 size) {
  return half4(position.x/size.x, position.y/size.y, position.x/size.y, 1.0);
}
