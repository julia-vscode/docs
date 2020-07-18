using Documenter

makedocs(
    sitename = "Julia in VS Code",
    pages = [
        "Home" => "index.md",
        "Setup" => "setup.md",
        "Getting Started" => "gettingstarted.md",
        "User Guide" => Any[
            "Running Code" => "userguide/runningcode.md",
            "Julia Environments" => "userguide/env.md",
            "Code Navigation" => "userguide/codenavigation.md",
            "Editing Code" => "userguide/editingcode.md",
            "Formatting Code" => "userguide/formatter.md",
            "Plot Gallery" => "userguide/plotgallery.md",
            "Data Grid" => "userguide/grid.md",
            "Understanding Code" => "userguide/understandingcode.md",
            "Linter" => "userguide/linter.md",
            "Tasks" => "userguide/tasks.md",
            "Debugging" => "userguide/debugging.md",
            "Compiling Sysimages" => "userguide/compilesysimage.md",
            "Julia Markdown Documents" => "userguide/weave.md",
            "Remote Development" => "userguide/remote.md",
            "Settings" => "userguide/settings.md"
        ],
        "What's New" => Any[
            "Version v0.17" => "release-notes/v0_17.md",
            "Version v0.16" => "release-notes/v0_16.md"
        ],
        "Developer Documentation" => Any[
            "Overview" => "devdocs/devdocs.md"
        ]
    ]
)

deploydocs(
    repo   = "github.com/julia-vscode/docs"
)
