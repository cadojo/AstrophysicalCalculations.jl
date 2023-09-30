"""
Astrophysical equations relating to special relativity.
"""
module SpecialRelativity

using DynamicQuantities
using LinearAlgebra

export
    lorentz_factor

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

- (Carrol & Ostlie 93)

"""
length_contraction(Lᵣ, u) = Lᵣ / lorentz_factor(u)

end