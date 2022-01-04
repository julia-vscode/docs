using JSON

function generate_keybindings()
    package = JSON.parsefile(joinpath(@__DIR__, "src", "package.json"))

    if package["name"] != "language-julia"
        throw(ErrorException("invalid package.json found"))
    end

    contributions = package["contributes"]

    kbds = contributions["keybindings"]
    cmds = contributions["commands"]
    cmd_dict = Dict{String, String}()

    for cmd in cmds
        cmd_dict[cmd["command"]] = cmd["title"]
    end

    open(joinpath(@__DIR__, "src", "userguide", "keybindings.md"), "w") do io
        println(io, "# Keybindings & Commands")

        println(io, """
        This page was auto-generated from [julia-vscode's package.json](https://github.com/julia-vscode/julia-vscode/blob/master/package.json)
        version $(package["version"]).
        """)

        println(io, "## Keyboard shortcuts")
        println(io, "```@raw html\n<ul>")
        for kbd in kbds
            if haskey(kbd, "command") && haskey(kbd, "key")
                println(io, "<li>", get(cmd_dict, kbd["command"], kbd["command"]), ": <kbd>", titlecase(kbd["key"]), "</kbd></li>")
            end
        end
        println(io, "</ul>\n```")

        println(io, "\n## Command overview")
        println(io, """
        You can discover these yourself by opening the Command Palette with Ctrl/Cmd-Shift-P and searching for "julia".
        """)
        for cmd in cmds
            println(io, "- $(cmd["title"]) (`$(cmd["command"])`)")
        end
    end
end
