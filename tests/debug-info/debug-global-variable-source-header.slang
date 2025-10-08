#ifndef DEBUG_GLOBAL_VARIABLE_SOURCE_HEADER_SLANG
#define DEBUG_GLOBAL_VARIABLE_SOURCE_HEADER_SLANG

float calculateDistanceFromCenter(float2 uv)
{
    float2 center = float2(0.5, 0.5);
    return length(uv - center);
}

#endif // DEBUG_GLOBAL_VARIABLE_SOURCE_HEADER_SLANG