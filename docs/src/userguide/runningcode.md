# Running Code

The Julia extension provides a number of different ways to run your Julia code. This section describes all these options, except how to run code in the debugger, which is covered in a separate part of the documentation.

## Running a Julia file

The VS Code command `Run: Start Without Debugging` (Ctrl+F5) by default starts a new Julia instance and runs the currently active Julia file. The command automatically creates a new VS Code terminal for this Julia process. If you choose to use the VS Code command `Run: Start Without Debugging`, then you first need to open a VS Code command palette, by typing `Ctrl+Shift+P`. A command palette will then appear where you can type `Run: Start Without Debugging`.

**Note** that the Julia instance that is started by this command is entirely independent from the Julia REPL that the extension also supports.

You can easily customize the behavior of `Run: Start Without Debugging` by creating a [launch configuration](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations). In many situations it is beneficial to not run the currently active file, but instead configure one file in your workspace as the main entry point for your project that is run when you press Ctrl+F5. 

Other customization options include *custom working directories*, *command line arguments* or a *specific Julia environment* (that is distinct from the active Julia environment in the VS Code window). Launch configurations also allow you to configure more complex execution scenarios where multiple Julia and non-Julia scripts are started simultaneously via [compound launch configurations](https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations).

The Julia extension itself supports the following launch configuration attributes:

- `program`: a path to a .jl file. This is the Julia file that will be run when this launch configuration is used. If this attribute is not specified, it defaults to the currently active Julia file in the editor.
- `cwd`: a path to a folder. The Julia process that is started by the launch configuration will use this path as the initial working directory. If this attribute is not specified, it defaults to the root working folder open in VS Code.
- `juliaEnv`: a path to a Julia project. The Julia process will be started with this Julia project as the active project. If this attribute is not specified, it defaults to the currently active Julia environment in the VS Code window.
- `args`: an array of command line arguments. The values specified in this list will be passed as command line arguments to the Julia process that is started and are available via the `Base.ARGS` variable in the Julia script. If this attribute is not specified, no command line arguments are passed to the Julia instance.

## The Julia REPL

The Julia extension provides a Julia REPL inside VS Code. You can start this REPL with the `Julia: Start REPL` command.

The Julia REPL in the extension is identical to the default Julia REPL, but adds a number of additional integrations (plot pane, grid viewer, debugger etc.) that are not part of the standard REPL. Note that only the REPL that you start with the `Julia: Start REPL` command has these integrations. If you start Julia from a system shell inside VS Code, it won't provide these integration points.

The REPL that is started with the `Julia: Start REPL` command will have the root folder of the currently active workspace as its working directory, and will be started with the Julia project that is currently active in the VS Code window.

## Running code in the Julia REPL

There are four commands that you can use to run code from your editor in the Julia REPL: 

- `Julia: Execute Code` (Ctrl+Enter)
- `Julia: Execute Code Block` (Alt+Enter)
- `Julia: Execute Code Cell` (Shift+Enter) 
- `Julia: Execute File`

### Julia: Execute Code (Ctrl+Enter)

This command will either send the text that is currently selected in the active editor to the Julia REPL, or it will send the entire line where the cursor is currently positioned when no text is selected. In the latter case it will also advance the cursor to the next line of code.

This command works a little bit like copy-paste: it will literally just copy some code from the editor into the REPL as if that code was typed in the REPL. This design has some consequences that you should keep in mind:
- When you send something, like a function definition to the REPL, no line or file information will be associated with that function. This can be annoying later on, when exceptions that are thrown in this function will not show any location information.
- `include` statements will always try to load relative paths relative to the current working directory, not relative to the file from which they are executed.
- Macros like `@__DIR__` and `@__FILE__` do not work properly.

Due to these limitations, most users should use the `Julia: Execute Code Block` command in most cases.

### Julia: Execute Code Block (Alt+Enter)

Whenever, there is some Julia code selected in the currently active editor, this command will execute the selected code. If no text is selected, the command will identify the extent of the top-level language construct that the cursor is located in (except modules) and execute that code block.

This command uses a different execution model than `Julia: Execute Code` that provides a more robust experience. In particular, it will associate location information with code that is executed, `include` will work correctly with relative paths and macros like `@__DIR__` and `@__FILE__` work as expected.

For most users, this should be their default command to run Julia code in the REPL.

### Julia: Execute Code Cell (Shift+Enter)

The extension provides support for demarking code cells in standard Julia files with a specially formatted comment: `##`. This command will identify in which code cell the cursor in the active editor currently is and then execute the code in that cell. If there are no code cells used in the current file, it will execute the entire file.

This command uses the same code execution techniques as the `Julia: Execute Code Block` command. Include statements, location information etc. all work as expected, that is run with this command.

### Julia: Execute File 

This command runs the entire content of the currently active file in the Julia REPL. It uses the same code execution techniques as the `Julia: Execute Code Block` command. Include statements, location information etc. all work as expected, that is run with this command.
