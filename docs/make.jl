using Documenter

makedocs(
    sitename = "Julia VS Code Extension Documentation",
    pages = [
        "index.md"
    ]
)

deploydocs(
    repo   = "github.com/julia-vscode/julia-vscode-documentation"
)