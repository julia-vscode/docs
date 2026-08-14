# Test item framework

The test item framework lets you structure tests into `@testitem` blocks that can be run
individually, from VS Code, the command line, the REPL or CI.

It has its own documentation site at [julia-testitems.org](https://julia-testitems.org),
which is the canonical place for everything about it: writing test items, the `@testitem`
keyword arguments, `@testmodule` and `@testsnippet`, configuration files, the `juliati`
command line runner and CI integration.

The page most relevant here is
[VS Code Integration](https://julia-testitems.org/guide/vscode), which covers how the Julia
extension discovers test items, the Testing activity bar and inline run buttons, parallel
test processes, debugging test items and code coverage.

To get started in VS Code, open a Julia package and switch to the Testing activity bar in
the side bar — the extension scans all `.jl` files for `@testitem`s after every keypress, so
anything it finds shows up there without any further setup.

See also [Configuration Files](configuration.md) for the `JuliaTestItems.toml` file that
controls which files are searched for test items.
