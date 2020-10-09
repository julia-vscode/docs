# Compiling Sysimages

The Julia VS Code extension enables you to compile a custom sysimage for your Julia environments. The extension automatically uses sysimages for the current environment when it starts a new Julia REPL in VS Code. 

Custom sysimages can significantly reduce load times for packages. 

## Creating a sysimage for the active environment

The Julia extension adds a build task for custom sysimages to the Visual Studio Code task system. To run the build task, select the command `Tasks: Run Build Task` and then select `Julia: Build custom sysimage for current environment`. 

The build task creates a sysimage that includes all packages in the current Julia environment. This sysimage is saved in the same folder where the `Project.toml` and `Manifest.toml` of the current Julia environment are stored. The name of the sysimage file will be `JuliaSysimage.dll` (Windows) or `JuliaSysimage.so`. 

## Using custom sysimages

When the Julia extension starts a new Julia REPL process, the extension first looks for a custom sysimage file for the current Julia environment. The extension then verifies whether the custom sysimage file is up to date by comparing the last modified date of the sysimage file to the last modified date of the `Manifest.toml` file. If an up to date sysimage file exists, the Julia extension automatically starts the Julia REPL process with the custom sysimage loaded. 
