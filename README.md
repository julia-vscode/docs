# Julia VS Code Documentation

![Deploy documentation](https://github.com/julia-vscode/docs/workflows/Deploy%20documentation/badge.svg)
[![Docs](https://img.shields.io/badge/docs-stable-blue.svg)](https://www.julia-vscode.org/docs/stable/)
[![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://www.julia-vscode.org/docs/dev/)

This repository contains the documentation for the [julia VS Code extension](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia).


## Contributing to the Documentation

In order to contribute to the documentation, simply modify the files in the `/docs/src` folder and open a PR against the `master` branch.
Once a PR has been opened, the CI will automatically run [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl) and generate a new documentation against the PR.
You can see the generate documentation on `https://www.julia-vscode.org/docs/previews/PR##`, where `##` is your PR's number.

Please refer to the VS Code contributing guide [here](https://github.com/microsoft/vscode-docs/blob/main/CONTRIBUTING.md) for details on best practices and how to refer to VS Code correctly.

## Local build of the Documentation

Although it's not necessary, if you want to check how the new documentation pages would look like in advance of opening a PR,
you can build documentations locally and check the results generated in `docs/build` by the following step:

> from the root of this repository:

```sh
$ julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path = pwd())); Pkg.instantiate()'
$ julia --project=docs/ docs/make.jl
```
