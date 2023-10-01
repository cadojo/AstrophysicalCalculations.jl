# 
# Astrophysical equations relating to observing distant stars.
#

export
    parallax_distance,
    radiant_flux,
    flux_ratio,
    flux_distance,
    M☉, L☉, σ, k,
    absolute_magnitude,
    absolute_magnitude_difference,
    blackbody_luminosity,
    blackbody_temperature,
    effective_luminosity,
    effective_temperature,
    blackbody_wavelength,
    blackbody_frequency

"""
The distance `d` to a cellestial object with parallax angle `p` and baseline distance `B`.

# Extended Help

## Caveats

The units of this calculation are equivalent to the units of `B`.

## References

- (Carrol & Ostlie 58)

"""
parallax_distance(p, B) = B / tan(p)

"""
The distance `d` in parsecs to a cellestial object with parallax angle `p′′`. 
One parsec is equivalent to 2.06264806e5 Astronomical Units (AU).

# Extended Help

## Caveats

This calculation requires the small-angle approximation. 

## References

- (Carrol & Ostlie 58)
"""
parallax_distance(p′′) = one(p′′) / p′′ * Constants.pc

"""
The radiant flux `F` captured by a spherical shell with radius `r`, emitted by 
a star with luminosity `L`, assuming no light is absorbed between the star's exterior
and the shell at radius `r`.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light, and assumes no light is 
    absorbed between the star's exterior and the shell at radius `r`.

## References

- (Carrol & Ostlie 61)
"""
radiant_flux(L, r) = L / (4π * r^2)


"""
The difference in absolute magnitudes `mᵢ` for two stars. The absolute magnitude `M` is 
defined as the apparent magnitude of the star if it were located 10 parsecs (pc) away.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light.

## References

- (Carrol & Ostlie 61)
"""
absolute_magnitude_difference(F₁, F₂) = -5 // 2 * log10(F₁ / F₂)

"""
The flux ratio for two stars, which is defined as the apparent magnitude of the star if it 
were located 10 parsecs (pc) away, given two apparent magnitudes `m₁` and `m₂`.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light.

## References

- (Carrol & Ostlie 61)
"""
flux_ratio(m₁, m₂) = 100^((m₁ - m₂) // 5)

"""
The distance to a star in parsecs (pc), given the apparent and absolute magnitudes.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light.

## References

- (Carrol & Ostlie 62)
"""
flux_distance(m, M) = 10^((m - M + 5) // 5) * Constants.pc

"""
The difference between apparent and absolute magnitudes, `m - M`, of a star, given the 
distance `d`.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light.

## References

- (Carrol & Ostlie 62)
"""
distance_modulus(d) = 5 * log10(d / 10Constants.pc)

"""
The absolute magnitude of the Sun.

# Extended Help

## Caveats

The use of this value assumes the inverse square law for light.

## References

- (Carrol & Ostlie 62)
"""
const M☉ = 4.74

"""
The luminosity of the Sun.

# Extended Help

## Caveats

The use of this value assumes the inverse square law for light.

## References

- (Carrol & Ostlie 62)
"""
const L☉ = 3.839e26 * DynamicQuantities.Units.W

"""
The absolute magnitude of a star, given its luminosity `L`, using our Sun's 
absolute magnitude and luminosity as a reference. 

# Extended Help

## Caveats

This calculation assumes the inverse square law for light, and uses our Sun's absolute
magnitude and luminosity as a reference.

## References

- (Carrol & Ostlie 62)
"""
absolute_magnitude(L) = M☉ - 5 // 2 * log10(L / L☉)

"""
The absolute magnitude of a star, given its luminosity `L`, using another star's 
absolute magnitude `Mᵣ` and luminosity `Lᵣ` as a reference. 

# Extended Help

## Caveats

This calculation assumes the inverse square law for light, and uses some other star's 
absolute magnitude and luminosity as a reference.

## References

- (Carrol & Ostlie 62)
"""
absolute_magnitude(L, Mᵣ, Lᵣ) = Mᵣ - 5 // 2 * log10(L / Lᵣ)


"""
The blackbody temperature `T`, given the maximum wavelength of emitted light, according to 
Wien's displacement law.

# Extended Help

## Caveats

This equation is valid for continuous spectrum of light; therefore, it is not physically 
realistic! The spectrum of light is discrete, not continuous.

## References

- (Carrol & Ostlie 69)

"""
blackbody_temperature(λₘ) = 0.002897766 * DynamicQuantities.Units.m * DynamicQuantities.Units.K

"""
The Stefan-Boltzmann constant `σ`.

# Extended Help

## Caveats

This constant is used in the Stefan-Boltzmann equation, and is not physically accurate due
to its assumption of a continuous spectrum of light. 

## References

- (Carrol & Ostlie 70)

"""
const σ = 5.670400e-8 * Units.W / Units.m^2 / Units.K^4

"""
The Boltzmann constant `k`.

# Extended Help

## Caveats

This constant is used in Planck's function. 

## References

- (Carrol & Ostlie 72)

"""
const k = 1.3806503e-23 * Units.J / Units.K

"""
The luminosity of some surface with area `A`, and blackbody temperature `T` in Kelvin.

# Extended Help

## Caveats

This equation assumes a **blackbody** temperature provided in Kelvin.

## References

- (Carrol & Ostlie 70)

"""
blackbody_luminosity(A, T) = A * σ * T^4


"""
The luminosity of some spherical star with radius R, and effective temperature `Tₑ`.

# Extended Help

## Caveats

This equation assumes the inverse square law of light.

## References

- (Carrol & Ostlie 70)

"""
effective_luminosity(R, Tₑ) = 4π * R^2 * σ * Tₑ^4

"""
The effective temperature of some spherical star with radiant flux `F`.

# Extended Help

## Caveats

This equation assumes the inverse square law of light, and the Stefan-Boltzmann constant.

## References

- (Carrol & Ostlie 70)

"""
effective_temperature(F) = (F / σ)^(1 // 4)



"""
The blackbody spectra at some wavelength `λ` and temperature `T`. This equation was 
derived by Planck, and builds on top of the Relleigh-Jean equation.

# Extended Help

## Caveats

This equation assumes the inverse square law of light.

## References

- (Carrol & Ostlie 73)

"""
blackbody_wavelength(λ, T) = (2Constants.h * Constants.c^2 / λ^5) / (exp(Constants.h * Constants.c / (λ * k * T)) - one(λ))


"""
The blackbody spectra at some frequency `ν` and temperature `T`. This re-formulation
of planck's function builds on top of the Relleigh-Jean equation. 

# Extended Help

## Caveats

This equation assumes the inverse square law of light.

## References

- (Carrol & Ostlie 73)

"""
blackbody_frequency(ν, T) = (2 * Constants.h * ν^3 / Constants.c^2) / (exp(h * ν / (k * T)) - one(ν))


"""
The bolometric correction `BC`, which is defined as the difference between a star's 
bolometric magnitude `Mᵦ` and its visual magnitude `Mᵥ`.

# Extended Help

## Caveats

This equation assumes the inverse square law of light.

## References

- (Carrol & Ostlie 76)

"""
bolometric_correction(Mᵦ, Mᵥ) = Mᵦ - Mᵥ

