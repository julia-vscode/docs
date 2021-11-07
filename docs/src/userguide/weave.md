# Julia Markdown Documents

The extension supports Weave markdown documents with the `.jmd` extension. All Julia code evaluation keybindings and commands should work normally, but cells are defined as fenced Julia code blocks instead (the usual `##` delimiter has no meaning here).

The `Julia Weave: Open Preview` command to weave the current file to a temporary HTML document, which will then be displayed in the editor. `Julia Weave: Save to File...` allows you to select the output format and will save the weaved document next to the source file.
