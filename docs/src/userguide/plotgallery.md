# Plot Gallery

Julia `Plots` provides us with the capability to create visualizations of data.

## Install `Plots` Package

First, `Open` the Julia Terminal (also known as REPL), you can follow the steps [here](https://www.julia-vscode.org/docs/stable/userguide/runningcode/#The-Julia-REPL-1).

At the Julia prompt in the REPL window, type the following:

```
julia> using Pkg
```

This will tell Julia that you are going to use the package manager.

Then type the following to add `Plots` package:

```
julia> Pkg.add("Plots")
```

## Create Visualization

**Remember** to keep the REPL open as this is where any output from your program will be printed.

The first piece of code that you need to execute is this:

```
using Plots
```

This tells Julia to load the library that we will use to create our visualizations.

### Example

Let's walkthrough a simple program to understand this:

Write the following code.

```
using Plots
x = 1:10; y = rand(10); # These are the plotting data
plot(x,y, label="my label")
```

Now `Run` this, you can follow the steps [here](https://www.julia-vscode.org/docs/stable/userguide/runningcode/#Running-code-in-the-Julia-REPL-1).

You will get something like the following graph as a output in a new tab in VSCode:

![Plot Graph](../images/PlotGallery/PlotGraph.png)

## Export Visualization

### Save Visualization

You can save plots to disk by clicking on the `Save Plot` button in the plot pane.
![Copy Plot](../images/PlotGallery/SavePlot.png)

The file picker by default opens in the root of the project. You can specify a custom path in `.vscode/settings.json`.

```json
{
  "julia.plots.path": "my_custom_path"
}
```

![Custom Path](../images/PlotGallery/CustomPath.png)

### Copy Visualization to Clipboard

!!! note

    Due to a current limitation in the [ClipboardItem API](https://developer.mozilla.org/en-US/docs/Web/API/ClipboardItem), plots are copied as png.

You can copy plots to clipboard by clicking on the `Copy Plot` button in the plot pane.

![Copy Plot](../images/PlotGallery/CopyPlot.png)
