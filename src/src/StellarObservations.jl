"""
Astrophysical equations relating to observing distant stars.
"""
module StellarObservations

using DynamicQuantities

export
    parallax_distance,
    radiant_flux,
    flux_ratio,
    flux_distance,
    M☉, L☉

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
parallax_distance(p′′) = one(p′′) / p′′ * us"Constants.pc"

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
flux_distance(m, M) = 10^((m - M + 5) // 5) * us"Constants.pc"

"""
The difference between apparent and absolute magnitudes, `m - M`, of a star, given the 
distance `d`.

# Extended Help

## Caveats

This calculation assumes the inverse square law for light.

## References

- (Carrol & Ostlie 62)
"""
distance_modulus(d) = 5 * log10(d / 10us"Constants.pc")

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
const L☉ = 3.839e26 * us"W"

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


end