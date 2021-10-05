# Formatting Code

Formatting helps to keep code readable by automatically aligning indentations and spaces.

The Julia formatter can automatically make this code:
```julia
f(x)=2x+3
print(f'( 2 ))

open("myfile.txt", "w") do io
	write(io, "Hello world!")
    end;
```

look like this:
```julia
f(x) = 2x + 3
print(f'(2))

open("myfile.txt", "w") do io
	write(io, "Hello world!")
end;
```

It's the very same code, though now it's much easier to read.

In order to format your code press `shift + cmd|windows + p` to bring up the command palette and search for `Format Document`

```@raw html
<img width="741" alt="grafik" src="https://user-images.githubusercontent.com/28377948/135749171-c6708afb-0f08-4268-b041-d24de4226e7f.png">
```
