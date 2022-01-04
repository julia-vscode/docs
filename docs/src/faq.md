# [Frequently Asked Questions](@id FAQ)

### The language server fails to precompile. What can I do about that?
You've probably been directed here by a pop-up like the following
![LS precompilation failure](./images/precompile-failure.png)

Click the `Open Logs` button or go to `Output` > `Julia Language Server`. You should see a message like this, among others:
```
The Language Server failed to precompile.
Please make sure you have permissions to write to the LS depot path at
	/home/pfitzseb/.config/Code/User/globalStorage/julialang.language-julia/lsdepot/v1
```

Your current account needs to have read/write access to the indicated directory. Also make sure that it isn't on a NFS volume or similar, as that may cause issues.

### The integrated REPL closes when the Julia process crashes. How do I get more information on what's going on?
Keeping the integrated terminal open when the underlying process crashes is currently blocked on getting support
for this in upstream VS Code. For now, try one of the two following options:

- On Linux/MacOS, you can try the tmux integration (provided you have tmux installed on your system). That will make sure the underlying process stays alive even when the Julia process is terminated, so you should be able to see the actual error message.
- Start a new terminal (integrated or external) and manually start Julia within that terminal. Then use the `Julia: Connect external REPL` command and follow the instructions. After the Julia session is connected to VS Code, run your code as before; the terminal will stay open after Julia closes.
