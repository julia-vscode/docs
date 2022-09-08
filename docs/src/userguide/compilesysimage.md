# Compiling Sysimages

The Julia VS Code extension enables you to compile a custom sysimage for your Julia environments. The extension automatically uses sysimages for the current environment when it starts a new Julia REPL in VS Code. 

Custom sysimages can significantly reduce load times for packages. 

## Creating a sysimage for the active environment

The Julia extension adds a build task for custom sysimages to the Visual Studio Code task system. To run the build task, select the command `Tasks: Run Build Task` and then select `Julia: Build custom sysimage for current environment`. 

By default, all of the packages defined in the `Project.toml` file are included in the system image. However, those added by `dev` are excluded as they are intended for developments and often subject to changes.

Additional options can be passed to further tweak the compilation. In particular, one may want to include script containing the precompile statements or a file to execute certain julia function, which can further reduce the first-call latency. Please read the documentation of [PackageCompiler.jl](https://julialang.github.io/PackageCompiler.jl/stable/) for more details.

This file should be named `./.vscode/JuliaSysimage.toml` and be placed under the project root file. Its content should look like:

```
[sysimage]
exclude=["Pkg1", "Pkg2"]   # Additional packages to be excluded in the system image
statements_files=["relative/path/to/precompile_statements_file.jl", ]
execution_files=["relative/path/to/precompile_execution_file.jl", ]
```
The packages to be excluded have to be separated by commas, each with quotation marks and all inside square brackets.
The path should be relative to the currently active folder, which can be selected by the command `File: Open Folder...`. The statement or execution files can be given as a single relative path, or as a list of relative paths.

The statement files should contain precompile statements of the form `precompile(Tuple{typeof(Base.sin), Float64})`, and the execution files should contain function calls for which the methods should be compiled. 

The build task creates a sysimage that includes all packages in the current Julia environment. This sysimage is saved in the same folder where the `Project.toml` and `Manifest.toml` of the current Julia environment are stored. The name of the sysimage file will be `JuliaSysimage.dll` (Windows) or `JuliaSysimage.so`. 

## Using custom sysimages

When the Julia extension starts a new Julia REPL process, the extension first looks for a custom sysimage file for the current Julia environment. The extension then verifies whether the custom sysimage file is up to date by comparing the last modified date of the sysimage file to the last modified date of the `Manifest.toml` file. If an up to date sysimage file exists, the Julia extension automatically starts the Julia REPL process with the custom sysimage loaded. 
This requires the `useCustomSysimage` field to be set to `true` in the application settings of the extension.
