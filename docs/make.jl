using Documenter
using AstrophysicalCalculations

makedocs(
    sitename="AstrophysicalCalculations",
    format=Documenter.HTML(),
    modules=[AstrophysicalCalculations],
    pages=[
        "Overview" => [
            "Getting Started" => "index.md",
            "Docstrings" => "docstrings.md"
        ],
        "Models" => [
            "Stellar Observations" => "observations.md",
        ]
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/AstrodynamicalModels.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
