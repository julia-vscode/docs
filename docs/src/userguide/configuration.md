# Configuration Files

Some of what the extension does is configured per project rather than in VS Code settings. Three optional TOML files, placed in your project, control the linter, the formatter and test item discovery:

| File | Controls |
| --- | --- |
| `JuliaLint.toml` | Which problems are reported, and how severe they are |
| `JuliaFormat.toml` | How your code is formatted |
| `JuliaTestItems.toml` | Which files are searched for test items |

These are project files rather than VS Code settings because the choices belong to the project, not to you personally. They get committed to the repository, so everyone on the team sees the same problems and gets the same formatting — and so do the `julialint` and `juliaformat` command line tools when they run in CI. The extension notices edits to these files as soon as you save them.

All three files are optional. Without them you get sensible defaults.

## How the files are found

The nearest file governs, and only that one.

To work out how a source file is configured, the extension looks in that file's folder, then its parent, and so on, and uses the first matching config file it finds. That file then applies as a whole — anything it does not set falls back to the built-in defaults, never to a value from a config file higher up the tree.

```
mypackage/
  JuliaLint.toml        <- governs everything, except...
  src/
    JuliaLint.toml      <- ...src/, which this one governs entirely
    MyPackage.jl
```

Here `src/MyPackage.jl` is configured by `src/JuliaLint.toml` alone. Nothing from the file in the root reaches it.

This means a nested config file has to repeat anything it wants to keep from its parent — the easiest way to write one is to copy the parent file and edit the copy. What you get in return is that working out how a folder is configured is always a matter of reading a single file. Most projects only ever need one config file, in the root.

Because replacing a config silently would be a nasty surprise, a config file that has another of the same kind above it is flagged with a warning naming the file it takes over from. That is usually what you want to know — the common way a stray config appears is a vendored repository or a copied example, where the shadowing is accidental. If a subtree is meant to be independent, turn the warning off in it:

```toml
[rules]
shadowed_config = "off"
```

The file names are matched without regard to case, so `JuliaLint.toml` and `julialint.toml` both work. A leading dot does not: `.JuliaLint.toml` is ignored.

## Choosing which files are affected

All three files accept `include` and `exclude` lists of glob patterns, relative to the folder holding the config file:

```toml
include = ["src/**", "test/**"]
exclude = ["**/generated_*.jl"]
```

`exclude` always wins over `include`, and leaving `include` out selects everything.

The patterns work like `.gitignore` patterns:

| Pattern | Matches |
| --- | --- |
| `src/**` | Everything under `src/`, at any depth |
| `*.jl` | Any `.jl` file, at any depth |
| `/setup.jl` | Only `setup.jl` in the config file's own folder |
| `test/manual_*.jl` | Files like `test/manual_foo.jl` |
| `gen/` | Everything below the `gen/` folder |

A leading `/` anchors a pattern to the config file's folder, and a pattern with no `/` in it matches at any depth. Always write `/` as the separator, on every platform.

## Different settings for part of a project

Rather than adding a second config file, add an `[[override]]` block. It re-applies part of the file to just the paths its `paths` patterns match. If several blocks match, the last one wins.

```toml
[rules]
unused_binding = "warning"

# Test code is noisier by nature, so don't complain about this there.
[[override]]
paths = ["test/**"]

[override.rules]
unused_binding = "off"
```

## Linting: `JuliaLint.toml`

Every problem the extension reports for Julia code comes from a *rule*, and every rule has a *severity*. This file changes those severities.

```toml
preset = "default"
exclude = ["gen/**"]

[rules]
unused_binding = "warning"
nothing_comparison = "error"
type_piracy = "off"
```

### Finding a rule's name

The Problems panel shows the rule id of each problem in its **Code** column. That id is exactly what you write under `[rules]`, so if something is bothering you, read its code and turn it off.

### Severities

Each rule takes one of `"off"`, `"hint"`, `"info"`, `"warning"` or `"error"`.

There is no separate on/off switch — `"off"` is just another severity. The middle values control how prominently VS Code shows the problem, and `"error"` additionally makes `julialint` fail in CI.

Changing a severity does not change how code is decorated in the editor. Unused variables stay greyed out whether you report them as a hint or an error, because the greying comes from the kind of problem rather than from how much you care about it.

### Presets

A preset sets the starting severity for every rule at once. Entries under `[rules]` then adjust individual rules on top of it.

| Preset | Effect |
| --- | --- |
| `minimal` | Only genuine breakage: syntax errors, malformed test items, broken TOML, bad `include`s. Everything stylistic is off. |
| `default` | What you get without a config file. |
| `strict` | Every rule on, with hints and informational messages raised to warnings. |

So a project that wants a quiet editor but still cares about one specific thing can write:

```toml
preset = "minimal"

[rules]
nothing_comparison = "error"
```

A preset name tracks the extension rather than freezing a fixed set of rules, so an update can change what it reports. New rules are added to existing presets switched off, so an update should not start flooding you with problems you did not ask for.

### Quick fixes follow the rules

When you turn a rule off, the lightbulb quick fix that would have fixed it disappears too — there is no point offering to fix something you have said you do not want to hear about. Refactorings such as **Expand function** are not affected, because they are editor features rather than fixes for a problem.

### The most common rules

| Rule | Default | Reports |
| --- | --- | --- |
| `unused_binding` | `hint` | Variables assigned but never used |
| `unused_function_argument` | `hint` | Unused function arguments |
| `missing_reference` | `warning` | Names that could not be resolved |
| `unresolved_import` | `warning` | Imports whose package could not be found |
| `incorrect_call_args` | `info` | Calls with the wrong number or type of arguments |
| `nothing_comparison` | `info` | `== nothing` instead of `isnothing` or `===` |
| `type_piracy` | `info` | Extending another module's function on foreign types |
| `include_errors` | `warning` | Circular, duplicate or missing `include`s |
| `syntax_errors` | `error` | Julia syntax errors |
| `testitem_errors` | `error` | Malformed `@testitem` blocks |
| `shadowed_config` | `warning` | A config file that supersedes another above it |

There are 27 rules in total. The full list is in the [JuliaLintApp documentation](https://github.com/julia-vscode/JuliaLintApp.jl#configuration).

## Formatting: `JuliaFormat.toml`

Controls **Format Document**, **Format Selection** and format-on-save. See [Formatting Code](formatter.md) for the commands themselves.

```toml
style = "blue"
exclude = ["gen/**"]

[options]
margin = 92

[[override]]
paths = ["docs/**"]

[override.options]
margin = 80
```

`style` picks a preset — `default`, `yas`, `blue`, `sciml`, `minimal` (the default) or `runic` — and `[options]` adjusts individual settings on top of it. Any [JuliaFormatter.jl option](https://domluna.github.io/JuliaFormatter.jl/stable/) can go in `[options]`. The `runic` style takes no options at all, so combining the two is reported as an error rather than quietly ignored.

Files excluded here are simply left alone by the formatter.

Note that the extension does **not** read JuliaFormatter.jl's own `.JuliaFormatter.toml`. If you have one, its settings will not apply — copy them into `JuliaFormat.toml`, with the individual options nested under `[options]`.

## Test items: `JuliaTestItems.toml`

Controls which files are searched for `@testitem` blocks, and so what shows up in the Testing view. See [Test Item Framework](testitems.md) for everything else about test items.

```toml
include = ["src/**", "test/**"]
exclude = ["test/manual/**"]
```

This is worth setting when a project contains vendored or generated code with test items you have no interest in running, or scratch files you keep around for debugging. Excluded files never appear in the test explorer.

Note that a *malformed* test item is a linting matter rather than a discovery one, controlled by the `testitem_errors` rule in `JuliaLint.toml`.

Settings such as the number of test processes are not part of this file; those are still VS Code settings.

## When you get a config file wrong

If you misspell a key, name a rule that does not exist, or give an invalid value, it is reported as a problem on the config file itself. Open the file and look at the Problems panel.

Keys from the older configuration format get special treatment: instead of a bare "unknown key" you are told what to write instead. If you have a `JuliaLint.toml` or `JuliaFormat.toml` from an earlier version of the extension, open it and the listed problems will spell out the migration for you.

Settings in the old format no longer take effect. In particular, a project that used `static-lint = false` to switch linting off will start showing problems again until its config file is updated — `preset = "minimal"` is the closest replacement.

## Full reference

The complete specification of all three file formats, including details this page glosses over, is in the [JuliaWorkspaces configuration reference](https://www.julia-vscode.org/JuliaWorkspaces.jl/dev/configuration/).
