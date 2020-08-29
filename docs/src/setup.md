# Setup

Getting the Julia extension for VS Code to work involves two steps:
1) Install VS Code and then,
2) Install the Julia extension. 

In rare situations you also need to configure the extension to find your Julia installation.

## Installing VS Code

- Just head over to the [VS Code](https://code.visualstudio.com/) homepage. 
- Follow the installation instructions for your platform. 

At the end of this step you should be able to start VS Code.

## Install the Julia extension

- First, start VS Code.
- Inside VS Code, go to the extensions view either by executing the `View: Show Extensions` command (click View->Command Palette...) or by clicking on the extension icon on the left side of the VS Code window.
- In the extensions view, simply search for the term `julia` in the marketplace search box, then select the Julia extension and click the install button. 
- You might have to restart VS Code after this step.

## Configure the Julia extension

- If you have installed Julia into a standard location on Mac or Windows, or if the Julia binary is on your `PATH`, the Julia VS Code extension should automatically find your Julia installation and you should not need to configure anything.

- If the extension does not find your Julia installation automatically, or if you want to use a different Julia installation than the default one,
  - You can set the `julia.executablePath` to the full path of Julia executable that the extension should use. In that case the extension will always use that version of Julia.
  - To edit your configuration settings, 
    - execute the `Preferences: Open User Settings` command (you can also access it via the menu `File->Preferences->Settings`),
    - And then make sure your user settings include the `julia.executablePath` setting.
    
    The format of the string should follow your platform specific conventions, and be aware that the backlash `\` is the escape character in JSON, so you need to use `\\` as the path separator character on Windows.
