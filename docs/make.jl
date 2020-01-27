using Documenter

makedocs(
    sitename = "Julia VS Code Extension Documentation",
    pages = [
        "Overview" => "index.md",
        "Setup" => "setup.md",
        "User Guide" => "userguide.ms"

    ]
)

deploydocs(
    repo   = "github.com/julia-vscode/docs"
)
