"""
Astrophysical equations relating to the wave-nature of light, without any relativistic 
effects.
"""
module LightWaves

using DynamicQuantities

export
    wave_speed

"""
The speed of a wave, given its wavelength `λ` and frequency `ν`.

# Extended Help

## Caveats

This calculation is not physically realistic for light waves; the speed of light is a 
fundamental constant of nature: $(Constants.c).

## References

- (Carrol & Ostlie 63)

"""
wave_speed(λ, ν) = λ * ν

end