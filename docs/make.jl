using Documenter

# download latest changelog
download("https://raw.githubusercontent.com/julia-vscode/julia-vscode/master/CHANGELOG.md", joinpath(@__DIR__, "src", "changelog.md"))

makedocs(
    sitename = "Julia in VS Code",
    pages = [
        "Home" => "index.md",
        # "Setup" => "setup.md",
        "Getting Started" => "gettingstarted.md",
        "FAQ" => "faq.md",
        "User Guide" => Any[
            "Running Code" => "userguide/runningcode.md",
            "Julia Environments" => "userguide/env.md",
            "Code Navigation" => "userguide/codenavigation.md",
            "Editing Code" => "userguide/editingcode.md",
            "Formatting Code" => "userguide/formatter.md",
            "Plots" => "userguide/plotgallery.md",
            "Table Viewer" => "userguide/grid.md",
            # "Understanding Code" => "userguide/understandingcode.md",
            "Linter" => "userguide/linter.md",
            # "Tasks" => "userguide/tasks.md",
            "Debugging" => "userguide/debugging.md",
            "Compiling Sysimages" => "userguide/compilesysimage.md",
            "Julia Markdown Documents" => "userguide/weave.md",
            "Remote Development" => "userguide/remote.md",
            # "Settings" => "userguide/settings.md"
        ],
        "Change Log" => "changelog.md",
        "Developer Documentation" => Any[
            "Overview" => "devdocs/devdocs.md"
        ]
    ],
    format = Documenter.HTML(
        prettyurls = ("CI" in keys(ENV))
    )
)

deploydocs(
    repo   = "github.com/julia-vscode/docs";
    push_preview = true
)
