"""
Equations common to introductory astrophysics coursework. All calculations
are directly referenced from the second edition of _An Introduction to Modern
Astrophysics_ by Carroll and Ostlie. 

# Extended Help

## Quantities

This package uses `DynamicQuantities.jl` for all unit-handling. For some calculations, 
constants from the `DynamicQuantities.Cosntants` module are used, i.e. parsecs `pc`.
See the `DynamicQuantities.jl` documentation for more information about converting
to and from quantity types, and for interoperability instructions with other unit-handling
packages within Julia (namely, `Unitful.jl`).

## References

Reference information for the primary text, _An Introduction to Modern Astrophysics_,
is shown via BibTeX below.

    @book{carroll2017introduction,
        title={An Introduction to Modern Astrophysics},
        author={Carroll, Bradley W and Ostlie, Dale A},
        year={2017},
        publisher={Cambridge University Press}
    }

## Imports

$(IMPORTS)

## Exports

$(EXPORTS)
"""
module AstrophysicalCalculations

using DynamicQuantities
using DocStringExtensions
using Reexport

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)

                                         $(DOCSTRING)
                                         """

@template (TYPES,) = """
                     $(TYPEDEF)
                     $(FIELDS)

                     $(DOCSTRING)
                     """

@template (CONSTANTS,) = """
                         $(TYPEDEF)

                         $(DOCSTRING)
                         """

include(joinpath("src", "StellarObservations.jl"))
@reexport using .StellarObservations

include(joinpath("src", "LightWaves.jl"))
@reexport using .LightWaves

end # module AstrophysicalCalculations
