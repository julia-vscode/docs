## Setup

Getting the julia extension for VS Code to work involves two steps: 1) Install VS Code and 2) install the julia extension. In rare situations you also need to configure the extension to find your Julia installation.

### Installing VS Code

Just head over to the [VS Code](https://code.visualstudio.com/) homepage and follow the installation instructions for your platform. At the end of this step you should be able to start VS Code.

### Install the julia extension

First, start VS Code. Inside VS Code, go to the extensions view either by executing the `View: Show Extensions` command (click View->Command Palette...) or by clicking on the extension icon on the left side of the VS Code window.

In the extensions view, simply search for the term `julia` in the marketplace search box, then select the julia extension and click the install button. You might have to restart VS Code after this step.

### Configure the julia extension

If you have installed julia into a standard location on Mac or Windows, or if the julia binary is on your `PATH`, the julia VS Code extension should automatically find your julia installation and you should not need to configure anything.

If the extension does not find your julia installation automatically, or if you want to use a different julia installation than the default one, you can set the `julia.executablePath` to point to the julia executable that the extension should use. In that case the extension will always use that version of julia. To edit your configuration settings, execute the `Preferences: Open User Settings` command (you can also access it via the menu `File->Preferences->Settings`), and then make sure your user settings include the `julia.executablePath` setting. The format of the string should follow your platform specific conventions, and be aware that the backlash `\` is the escape character in JSON, so you need to use `\\` as the path separator character on Windows.
