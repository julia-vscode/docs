# Getting Started

This guide is intended for new or beginner-level users who are new to the Visual Studio (VS) Code extension. The getting started tasks use the Julia programming language to create a “Hello World” program in VS Code. 

## Prerequisites

- Julia
- VS Code
- VS Code Julia extension

## Installation and Configuration

### Installing Julia

Download the latest stable version of Julia, based on the platform you are using, from the [Julia](https://julialang.org/downloads/) homepage.

### Installing VS Code

Download and install VS Code, based on the platform you are using, from the [VS Code](https://code.visualstudio.com/) homepage.

### Installing the Julia extension

- Start or open Visual Studio Code. 
- Select **View** and then click **Extensions** to open Extension View. 
- Enter the term `julia` in the marketplace search box. Click the green **Install** button to download the extension. 
![Julia VS Code Extension](assets/julia_vscode_extension.png)

You successfully downloaded the Julia extension for VS Code. 

_NOTE: It is recommended that you restart VS Code after installation._ 

### Configuring the Julia extension

If you installed Julia into a standard location on Mac or Windows, or if the Julia binary is on your `PATH`, the Julia VS Code extension automatically finds your Julia installation. You do not need to configure the extension. Continue onto the next section. 

If the VS Code extension does not find your Julia installation automatically, or you want to use a different Julia installation than the default one, use the following steps to configure the extension.

  1. Set the `julia.executablePath` to the full path of Julia executable that the extension should use. 
  2. To edit your configuration settings, 
    - Select **File**, then select **Preferences**, and then click **Settings**. Ensure that your user settings include the `julia.executablePath` setting. 
    
_NOTE: The format of the string should follow your platform specific conventions.  Note that the backslash `\` is the escape character in JSON, therefore use `\\` as the path separator character on Windows._

## Creating Your First Julia Hello World program

From the File Explorer toolbar, select the New File button on the hello folder:

![Julia VS Code Extension](assets/hello-1.png)

Name the file hello.jl, and it automatically opens in the editor:

![Julia VS Code Extension](assets/hello-2.png)

By using the .jl file extension, you tell VS Code to interpret this file as a Julia program, so that it evaluates the contents with the Julia extension and the selected interpreter.
Now that you have a code file in your Workspace, enter the following source code in hello.jl:

```
msg = "Hello World"
println(msg)
```

### Run Hello World program

It's simple to run hello.jl with Julia. Just click the Run Julia File in Terminal play button in the top-right side of the editor.

![Julia VS Code Extension](assets/hello-3.png)

You can see the corresponding output in the terminal

![Julia VS Code Extension](assets/hello-4.png)

Voila! You have just completed your first Julia program. Lets learn more, Here is how you can install a julia package from lots of available packages.

### Installing a package

The package can be installed using Julia package manager or Pkg API.

**Using Package Manager**

Open the Julia terminal in VS Code and type ] to enter the Pkg REPL mode and run:

`pkg> add Documenter`

This command will install the Documenter package

**Using the Pkg API:**

`julia> import Pkg; Pkg.add("Documenter")`

### Next steps

To learn more about the Julia language, follow any of the programming tutorials listed on [Juilalang.org](https://docs.julialang.org/en/v1/) within the context of VS Code.


There is then much more to explore with Julia in Visual Studio Code:

- [Editing code](userguide/editingcode.md)
- [Linting](userguide/linter.md)
- [Debugging](userguide/debugging.md)
- [Plot Gallery](userguide/plotgallery.md)
- [Data Grid](userguide/grid.md)
- [Compiling SysImages](userguide/compilesysimage.md)
- [Settings](userguide/settings.md)
