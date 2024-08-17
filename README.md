# Setup

1. Install .NET from https://dotnet.microsoft.com/download
2. Install PowerShell as a .NET Core module: `dotnet tool install --global PowerShell`


# Terminal setup

1. Install `CascadiaCodeNF.ttf` from https://github.com/microsoft/cascadia-code/releases
2. Open Terminal then Settings (`Ctrl + ,`)
3. Update `actions` key:

  ```json
  "actions": 
  [
      {
          "command": 
          {
              "action": "closeTab"
          },
          "keys": "ctrl+w"
      },
      {
          "command": 
          {
              "action": "splitPane",
              "split": "auto"
          },
          "keys": "ctrl+shift+\\"
      },
      {
          "command": 
          {
              "action": "newTab"
          },
          "keys": "ctrl+t"
      }
  ],
  ```
4. Update `profiles.defaults` key:
    
    ```json
    "profiles":
    {
      "defaults": 
      {
          "bellStyle": "window",
          "font": 
          {
              "face": "CaskaydiaCove Nerd Font",
              "size": 10.0
          },
          "opacity": 92
      },
      ...
    }
    ```


# PowerShell setup

1. Install [posh-git](https://github.com/dahlbyk/posh-git)
2. Install [oh-my-posh](https://ohmyposh.dev/)
3. Copy or link files in PowerShell directory to `%USERPROFILE%\Documents\PowerShell`
4. Update paths in PowerShell/Microsoft.*.ps1 files to the correct `common_profile.ps1` path.


# Helpful articles

- https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx
  - Note: This is an older article. Some steps may not be necessary now.


# More software

- **VS Code** - https://code.visualstudio.com/
  *Really good code editor.*

- **XShell** - https://www.netsarang.com/en/xshell/
  *Good SSH client.*

- **KiTTY** - http://www.9bis.net/kitty/
  *Good SSH client. (Better than the one provided with PuTTY)*
  
- **PuTTY** - http://www.putty.org/
  *Comes with PuTTYgen for generating keys.*
