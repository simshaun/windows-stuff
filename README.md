# Setup

1. Install `Windows Terminal` from Microsoft Store
2. Install `Ubuntu` from Microsoft Store
  1. Run Ubuntu and go through any setup.
  2. Copy bash files and follow instructions from https://github.com/simshaun/bash
3. Install NVM for Windows from https://github.com/coreybutler/nvm-windows
4. Install .NET from https://dotnet.microsoft.com/download
5. Install PowerShell as a .NET Core module: `dotnet tool install --global PowerShell`


# Terminal setup

1. Install `CascadiaPL.ttf` from https://github.com/microsoft/cascadia-code/releases
2. Open Terminal
3. Open Settings (`Ctrl + ,`)
4. Copy settings from https://gist.github.com/simshaun/4a7f37ba091351ebcaae0ea3b30007e4


Note: As of time of writing, Windows Terminal does not integrate in to the right-click Explorer menu.
To do so, I use this PowerShell module: https://github.com/KUTlime/PowerShell-Open-Here-Module

1. Open PowerShell as an administrator
2. Run `Install-Module -Name OpenHere`
3. Run `Import-Module -Name OpenHere`
4. Run `Set-OpenHereShortcut -ShortcutType:WindowsTerminal`


# PowerShell setup

1. Open PowerShell in Terminal
2. Run `Install-Module posh-git -Scope CurrentUser`
3. Run `Install-Module oh-my-posh -Scope CurrentUser`
4. Copy files in PowerShell directory to `%USERPROFILE%\Documents\PowerShell`
5. Update paths in PowerShell/Microsoft.*.ps1 files to the correct `common_profile.ps1` path.


# CLI files

1. Copy contents of CLI folder to a folder on your PC.
2. Hit WinKey + Pause to open the System window.
3. Click "Advanced system settings" on the left.
4. Click the "Environment Variables" button.
5. Double-click the "Path" variable inside the User variables box.
6. Add the CLI folder you made to the path and then "OK" out of everything.


# Helpful articles

- https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
- https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx
  - Note: This is an older article. Some steps may not be necessary now.


# More software

- **VS Code** - https://code.visualstudio.com/
  *Really good code editor.*

- **KiTTY** - http://www.9bis.net/kitty/
  *Good SSH client. (Better than the one provided with PuTTY)*
  
- **PuTTY** - http://www.putty.org/
  *Comes with PuTTYgen for generating keys.*
