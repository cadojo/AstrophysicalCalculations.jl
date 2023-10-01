using Documenter
using AstrophysicalCalculations

makedocs(
    sitename="AstrophysicalCalculations",
    format=Documenter.HTML(),
    modules=[
        AstrophysicalCalculations,
    ],
    pages=[
        "Getting Started" => "index.md",
        "Reference" => "reference.md",
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/AstrophysicalCalculations.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
