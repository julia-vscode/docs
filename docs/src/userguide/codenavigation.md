# Code Navigation

## Quick File Navigation

> **Tip**: Hold `Ctrl+P` **(Quick Open)** to open any file by its name.

There are two commands which enable you to navigate in and across files with easy-to-use key bindings. 

- Hold `Ctrl` and press `Tab` to view a list of all files open in an editor group. 
- To open one of these files, press `Tab` again to pick the file you want to navigate to, then release `Ctrl` to open it.

![Code Navigation](../images/codenavigation/image1.png)

Alternatively, you can use `Alt+Left` and `Alt+Right` to navigate between files and edit locations. 
If you are jumping around between different lines of the same file, these shortcuts allow you to navigate between those locations easily.

## Open Package Directory

### Go to Definition

You can go to the definition of a symbol by pressing `F12`.

If you press `Ctrl` and hover over a symbol, a preview of the declaration will appear:

![](https://github.com/JuliaEditorSupport/julia-vscode-documentation/blob/master/media/definition.gif)

> **Tip**: You can jump to the definition with `Ctrl+Click` or open the definition to the side with `Ctrl+Alt+Click`.

### Go to Symbols

You can navigate symbols inside a file with `Ctrl+Shift+O`. 
Enter `:` and the symbols will be grouped by category. 
Press `Up` or `Down` and navigate to the place you want.

![](https://github.com/JuliaEditorSupport/julia-vscode-documentation/blob/master/media/symbols.gif)

### Open Symbol by Name

You can open a particular symbol by its name with `Ctrl+T`, regardless of which file contains it. Type the name of a symbol you want to navigate to, and press `Enter`

![Open Symbol](../images/codenavigation/OpenSymbol.png)
