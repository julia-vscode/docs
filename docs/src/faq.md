# Frequently Asked Questions

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
