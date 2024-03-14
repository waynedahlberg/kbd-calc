//
//  Flicker.metal
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/8/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

float random(float2 position) {
    return fract(sin(dot(position, float2(12.9898, 78.233)))
                     * 43758.5453123);
}

float noise(float2 st) {

    float2 i = floor(st);
    float2 f = fract(st);

    float a = random(i);
    float b = random(i + float2(1.0, 0.0));
    float c = random(i + float2(0.0, 1.0));
    float d = random(i + float2(1.0, 1.0));

    float2 u = f*f*(3.0-2.0*f);

    return mix(a, b, u.x)
        + (c - a) * u.y * (1.0 - u.x)
        + (d - b) * u.x * u.y;
}

[[ stitchable ]]
half4 perlinNoise(
    float2 position,
    half4 color,
    float2 size
) {
    float2 st = position / size;
    float2 pos = float2(st * 10);
    float n = noise(pos);
    return half4(half3(n), 1.0);
}
