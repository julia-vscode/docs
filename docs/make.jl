using Documenter

makedocs(
    sitename = "Julia VS Code Extension Documentation",
    pages = [
        "Home" => "index.md",
        "Setup" => "setup.md",
        "Getting Started" => "gettingstarted.md",
        "User Guide" => Any[
            "Running Code" => "userguide/runningcode.md",
            "Tasks" = > "userguide/tasks.md"
        ],
        "Developer Documentation" => Any[
            "Overview" => "devdocs/devdocs.md"
        ]
    ]
)

deploydocs(
    repo   = "github.com/julia-vscode/docs"
)
