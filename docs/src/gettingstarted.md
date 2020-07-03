## Getting Started

In this guide, you will use Julia language to create the simplest Julia "Hello World" application in Visual Studio Code. By using the Julia extension, you make VS Code turn into a great lightweight Julia IDE.

### Prerequisites

You need to first setup your Julia development environment. Specifically, this tutorial requires:

- Julia
- VS Code
- VS Code Julia extension

_Note: In rare situations you also need to configure the extension to find your Julia installation._

### Installing Julia

You can install the latest stable version of Julia from Julia homepage
- Just head over to the [Julia](https://julialang.org/downloads/) homepage.
- Download and install the version based on the platform you are using.

### Installing VS Code

If you have not already done so, you can install VS Code from the VS Code homepage
- Just head over to the [VS Code](https://code.visualstudio.com/) homepage.
- Follow the installation instructions for your platform.

At the end of this step you should be able to start VS Code.

### Install the Julia extension

![Julia VS Code Extension](assets/julia_vscode_extension.png)

- First, start VS Code.
- Inside VS Code, go to the extensions view either by executing the `View: Show Extensions` command (click View->Command Palette...) or by clicking on the extension icon on the left side of the VS Code window.
- In the extensions view, simply search for the term `julia` in the marketplace search box, then select the Julia extension and click the install button.
- You might have to restart VS Code after this step.

### Configure the Julia extension

- If you have installed Julia into a standard location on Mac or Windows, or if the Julia binary is on your `PATH`, the Julia VS Code extension should automatically find your Julia installation and you should not need to configure anything.

- If the extension does not find your Julia installation automatically, or if you want to use a different Julia installation than the default one,
  - You can set the `julia.executablePath` to the full path of Julia executable that the extension should use. In that case the extension will always use that version of Julia.
  - To edit your configuration settings,
    - execute the `Preferences: Open User Settings` command (you can also access it via the menu `File->Preferences->Settings`),
    - And then make sure your user settings include the `julia.executablePath` setting.

    The format of the string should follow your platform specific conventions, and be aware that the backlash `\` is the escape character in JSON, so you need to use `\\` as the path separator character on Windows.

### Create your first Julia Hello World program

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