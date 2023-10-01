# 
# Astrophysical equations relating to special relativity.
# 

export
    lorentz_factor,
    doppler_shift,
    time_dilation,
    length_contraction,
    redshift_parameter,
    flux_angle,
    relativistic_kinetic_energy,
    total_relativistic_energy,
    momentum_magnitude

"""
The relativistic factor `γ` that is within Lorentz Transformations, given reference
velocity `u`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 91)

"""
lorentz_factor(u) = inv(sqrt(one(u) - u^2 / Constants.c^2))

"""
The relativistic time scaling used within Lorentz Transformations, given reference
velocity `u`. This calculation returns the change in time of a moving reference frame, 
given the change in time in an at-rest frame `Δtᵣ`, and the velocity `u`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 93)

"""
time_dilation(Δtᵣ, u) = Δtᵣ * lorentz_factor(u)

"""
The relativistic length scaling used within Lorentz Transformations, given reference
velocity `u`. This calculation returns the length of an object in a moving reference frame, 
given the length of the same object in an at-rest frame `Lᵣ`, and the velocity `u`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 95)

"""
length_contraction(Lᵣ, u) = Lᵣ / lorentz_factor(u)

"""
The relativistic doppler shift observed from an object moving with speed `u` away from the
light, rest frequency `ν`, and radial velocity `vᵣ`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 98)

"""
doppler_shift(ν, vᵣ, u) = ν / lorentz_factor(u) / (one(vᵣ) + (vᵣ / Constants.c))

"""
The redshift parameter `z`, which describes the change in wavelength due to redshifting
with change in wavelength `Δλ` and rest wavelength `λᵣ`, or radial velocity `vᵣ`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 99)

"""
redshift_parameter(Δλ, λᵣ) = Δλ / λᵣ
redshift_parameter(vᵣ) = sqrt((one(vᵣ) + vᵣ / Constants.c) / (one(vᵣ) - vᵣ / Constants.c)) - one(vᵣ)

"""
The angle of radiant flux for a moving emitter given the Lorentz factor `γ`; this 
phenomena is known as the _relativistic headlight effect_. 

# Extended Help

## Caveats

This calculation is valid for velocities very close to the speed of light, and within the 
bounds of special relativity: that is, inertial reference frames.

## References

- (Carrol & Ostlie 101)

"""
flux_angle(γ) = asin(inv(γ))

"""
The momentum of a particle moving at relativistic speeds, given mass `m` and velocity `v`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 102)

"""
momentum(m, v) = lorentz_factor(norm(v)) * m * v

"""
The kinetic energy `K` of a particle moving at relativistic speeds, given mass `m` and 
velocity `v`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 103)

"""
relativistic_kinetic_energy(m, v) = m * Constants.c^2 * (lorentz_factor(norm(v)) - 1)

"""
The total energy `E` of a particle moving at relativistic speeds, given mass `m` and 
velocity `v`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 103)

"""
total_relativistic_energy(m, v) = m * Constants.c^2 * lorentz_factor(norm(v))

"""
The magnitude a particle's momentum `p`, given mass `m` and total energy `E`.

# Extended Help

## Caveats

This calculation is valid within the bounds of special relativity: that is, inertial 
reference frames.

## References

- (Carrol & Ostlie 103)

"""
momentum_magnitude(m, E) = sqrt((E^2 - (m^2 * Constants.c^4)) / Constants.c^2)
