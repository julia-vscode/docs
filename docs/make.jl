using Documenter

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

# Add line counts and/or skip empty docs
function annotate(pages)
    filter(p -> p !== nothing, [
        if doc isa String
            numlines = open("docs/src/$doc") do f
                length(readlines(f))
            end
            if numlines > 1 ### Skip empty docs
                "$title ($numlines lines)" => doc
            else
                nothing
            end
        else
            title => annotate(doc)
        end
        for (title,doc) in pages
    ])
end

pages = annotate(pages)

makedocs(
    sitename = "Julia in VS Code",
    pages = pages
)

deploydocs(
    repo   = "github.com/julia-vscode/docs";
    push_preview = true
)
