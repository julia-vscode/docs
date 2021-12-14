# Linting and Diagnostics

All Julia code in the workspace is statically linted. You can disable that feature with the `julia.lint.run` setting or configure it via various options with the `julia.lint.` prefix.

## Runtime diagnostics
Packages like [JET.jl](https://github.com/aviatesk/JET.jl) can analyze code at runtime (for some defintion of "runtime"):
![jet](../images/jet.png)

You can opt out of this feature with the `julia.showRuntimeDiagnostics` setting. Use `Julia: Clear Runtime Diagnostics` or `Julia: Clear Runtime Diagnostics by Provider` to clear the displayed diagnostics.

Package authors who want to use this feature can simply implement a type that supports the `application/vnd.julia-vscode.diagnostics` MIME type. Check `VSCodeServer.DIAGNOSTIC_MIME` in a the integrated Julia REPL for more information on the API.
