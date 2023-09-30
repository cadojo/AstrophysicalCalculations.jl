using Documenter
using AstrophysicalCalculations

makedocs(
    sitename="AstrophysicalCalculations",
    format=Documenter.HTML(),
    modules=[
        AstrophysicalCalculations,
        AstrophysicalCalculations.LightWaves,
        AstrophysicalCalculations.StellarObservations,
    ],
    pages=[
        "Overview" => [
            "Getting Started" => "index.md",
            "Documentation" => "reference.md",
        ],
        "Reference" => [
            "Light Waves" => "lightwaves.md",
            "Stellar Observations" => "observations.md",
        ]
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/AstrophysicalCalculations.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
