# Formatting Code

You can format the entire document by using `JuliaFormatter` package. It is useful when you need recursive formatting.
### Installation
```
  import Pkg; Pkg.add("JuliaFormatter")
```
### How to use

```
julia> using JuliaFormatter
```
### Recursively formats all Julia files in the current directory
```
julia> format(".")
```

### Formats an individual file
```
julia> format_file("foo.jl")
```

### Formats a string (contents of a Julia file)
```
julia> format_text(str)
```

You can also use format document command to format your complete document
- Open the Command Palette using `(Ctrl+Shift+P)`
- Type and select `Format Document`

Apart from above two methods, you can always use formatting shortcut `(Ctrl+K Ctrl+F)` to format your document.
