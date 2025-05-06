# Running Code

The Julia extension provides a number of different ways to run your Julia code. This section describes all these options, except how to run code in the debugger, which is covered in a separate part of the documentation.

## The Julia REPL

The Julia extension provides a Julia REPL inside VS Code. You can start this REPL with the `Julia: Start REPL` command.

The Julia REPL in the extension is identical to the default Julia REPL, but adds a number of additional integrations (plot pane, grid viewer, debugger etc.) that are not part of the standard REPL. Note that only the REPL that you start with the `Julia: Start REPL` command has these integrations. If you start Julia from a system shell inside VS Code, it won't provide these integration points.

The REPL that is started with the `Julia: Start REPL` command will have the root folder of the currently active workspace as its working directory, and will be started with the Julia project that is currently active in the VS Code window.

## Running code in the Julia REPL

There are four commands that you can use to run code from your editor in the Julia REPL:

- `Julia: Execute Code in REPL`
- `Julia: Execute Code Cell in REPL` / `Julia: Execute Code Cell in REPL and Move`
- `Julia: Execute File in REPL`
- `Julia: Run File in New Process`

### Julia: Execute Code in REPL

Whenever, there is some Julia code selected in the currently active editor, this command will execute the selected code. If no text is selected, the command will identify the extent of the top-level language construct that the cursor is located in (except modules) and execute that code block.

This command will associate location information with code that is executed, `include` will work correctly with relative paths and macros like `@__DIR__` and `@__FILE__` work as expected.

For most users, this should be their default command to run Julia code in the REPL.

### Julia: Execute Code Cell in REPL

The extension provides support for demarking code cells in standard Julia files with a specially formatted comment: `##` or `# %%`. Either symbol must occur the start of a line and can be followed by text. This command will identify in which code cell the cursor in the active editor currently is and then execute the code in that cell. If there are no code cells used in the current file, it will execute the entire file.

Cell delimiters can be specified as regex expressions with the `julia.cellDelimiters` user setting. The default being `["^##(?!#)", "^#(\\s?)%%", "^#-"].

This command uses the same code execution techniques as the `Julia: Execute Code Block` command. Include statements, location information etc. all work as expected, that is run with this command.

### Julia: Execute File in REPL

This command runs the entire content of the currently active file in the Julia REPL. It uses the same code execution techniques as the `Julia: Execute Code Block` command. Include statements, location information etc. all work as expected with this command. The ▶️ button in the top-right corner of the file editor window will by default execute this command.

### Julia: Run File in New Process

Sometimes it's desirable to run your code in a new process (e.g. if you want to be absolutely sure that no state from previously run code interferes), so this command will spawn a new Julia process and run the active file in it.

## Running a Julia file with a Custom Configuration

The VS Code command `Debug: Start Without Debugging` (Ctrl+F5) by default starts a new Julia instance and runs the currently active Julia file. The command automatically creates a new VS Code terminal for this Julia process.

**Note** that the Julia instance that is started by this command is entirely independent from the Julia REPL that the extension also supports. Thus some features of the integrated REPL such as the plot pane will not be shown when running files with this method.

You can easily customize the behavior of `Debug: Start Without Debugging` by creating a [launch configuration](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations). In many situations it is beneficial to not run the currently active file, but instead configure one file in your workspace as the main entry point for your project that is run when you press Ctrl+F5.

Other customization options include *custom working directories*, *command line arguments* or a *specific Julia environment* (that is distinct from the active Julia environment in the VS Code window). Launch configurations also allow you to configure more complex execution scenarios where multiple Julia and non-Julia scripts are started simultaneously via [compound launch configurations](https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations).

The Julia extension itself supports the following launch configuration attributes:

- `program`: a path to a .jl file. This is the Julia file that will be run when this launch configuration is used. If this attribute is not specified, it defaults to the currently active Julia file in the editor.
- `cwd`: a path to a folder. The Julia process that is started by the launch configuration will use this path as the initial working directory. If this attribute is not specified, it defaults to the root working folder open in VS Code.
- `juliaEnv`: a path to a Julia project. The Julia process will be started with this Julia project as the active project. If this attribute is not specified, it defaults to the currently active Julia environment in the VS Code window.
- `args`: an array of command line arguments. The values specified in this list will be passed as command line arguments to the Julia process that is started and are available via the `Base.ARGS` variable in the Julia script. If this attribute is not specified, no command line arguments are passed to the Julia instance.
