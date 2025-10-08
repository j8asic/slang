//TEST:SIMPLE(filecheck=CHECK):-target spirv-asm -gdwarf -g3 -O0 -stage fragment -entry main

#include "debug-global-variable-source-header.slang"

struct VertexOutput
{
    float4 position : SV_Position;
    float2 texCoord : TEXCOORD0;
}

[shader("fragment")]
float4 main(VertexOutput input) : SV_Target
{
    float2 uv = input.texCoord;
    float distanceFromCenter = calculateDistanceFromCenter(uv);
    float4 color = float4(uv.x, uv.y, distanceFromCenter, 1.0);
    return color;
}

// CHECK: debug-global-variable-source-header.slang"
// CHECK: debug-global-variable-source.slang"
// The key test: entry point parameters should reference the main file, not the header file
// CHECK: DebugGlobalVariable {{.*}} %{{[0-9]+}} {{.*}} %{{[0-9]+}}
// CHECK: DebugGlobalVariable {{.*}} %{{[0-9]+}} {{.*}} %{{[0-9]+}}