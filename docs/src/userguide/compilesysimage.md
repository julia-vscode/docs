# Compiling Sysimages

The Julia VS Code extension makes it easy to compile a custom sysimage for your Julia environments. The extension will also automatically use sysimages for the current environment when it starts a new Julia REPL in VS Code.

Custom sysimages can significantly reduce load times for packages.

## Creating a sysimage for the active environment

The Julia extension adds a build task for custom sysimages to the Visual Studio Code task system. To run this build task, select the command `Tasks: Run Build Task` and then select `Julia: Build custom sysimage for current environment`.

The build task will create a sysimage that includes all packages in the current Julia environment. This sysimage will be saved in the same folder where the `Project.toml` and `Manifest.toml` of the current Julia environment are stored. The name of the sysimage file will be `JuliaSysimage.dll` (Windows) or `JuliaSysimage.so`.

## Using custom sysimages

Whenever the Julia extension starts a new Julia REPL process, it will first look whether a custom sysimage file exists for the current Julia environment, and whether this custom sysimage file is up-to-date (by comparing the last modified date of the sysimage file with the last modified date of the `Manifest.toml` file). If an up-to-date sysimage file exists, the Julia extension will automatically start the Julia REPL process with this custom sysimage loaded.
