"""
Astrophysical equations relating to the wave-nature of light, without any relativistic 
effects.
"""
module LightWaves

using DynamicQuantities
using LinearAlgebra

export
    wave_speed,
    poynting,
    mean_poynting

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

"""
The positions `d * sin(θ)` of constructive interference for the double-slit experiment.

# Extended Help

## Caveats

This calculation assumes `n` multiples of `λ`, where `n` is between `0` and `inf`, 
inclusive.

## References

- (Carrol & Ostlie 65)

"""
constructive_interference(n::Integer, λ) = n * λ

"""
The positions `d * sin(θ)` of destructive interference for the double-slit experiment.

# Extended Help

## Caveats

This calculation assumes `n` multiples of `λ`, where `n` is between `1` and `inf`, 
inclusive.

## References

- (Carrol & Ostlie 65)

"""
destructive_interference(n::Integer, λ) = (n - 1 // 2) * λ

"""
The Poynting vector `S`, which describes the rate that a light wave carries its energy,
given electric and magnetic fields `E` and `B`. This vector points in the direction
of the electromagnetic wave's propagation. 

# Extended Help

## Caveats

Electric and magnetic field strengths vary with time, so the time-averaged value of this
vector is what is often physically important. 

## References

- (Carrol & Ostlie 65)

"""
poynting(E, B) = (E × B) / Constants.mu_0

"""
The time-average of the Poynting vector `S`, which describes the rate that a light wave 
carries its energy, given electric and magnetic fields `E` and `B`. This vector points in 
the direction of the electromagnetic wave's propagation. 

# Extended Help

## Caveats

Electric and magnetic field strengths vary with time, so the time-averaged value of this
vector is what is often physically important. 

## References

- (Carrol & Ostlie 67)

"""
mean_poynting(E₀, B₀) = (E₀ * B₀) / 2Constants.mu_0

"""
The radiation pressure exerted on a surface which absorbs light, where `θ` is the angle
of incidence of the light on the surface, and `A` is the area of the surface.

# Extended Help

## Caveats

This equation is valid for surfaces which completely absorb light.

## References

- (Carrol & Ostlie 67)

"""
absorption_pressure(S₀, A, θ) = S₀ * A / Constants.c * cos(θ)
absorption_pressure(E₀, B₀, A, θ) = absorption_pressure(mean_poynting(E₀, B₀), A, θ)

"""
The radiation pressure exerted on a surface which reflects light, where `θ` is the angle
of incidence of the light on the surface, and `A` is the area of the surface.

# Extended Help

## Caveats

This equation is valid for surfaces which completely reflect light.

## References

- (Carrol & Ostlie 67)

"""
reflection_pressure(S₀, A, θ) = 2S₀ * A / Constants.c * (cos(θ))^2
reflection_pressure(E₀, B₀, A, θ) = reflection_pressure(mean_poynting(E₀, B₀), A, θ)

end