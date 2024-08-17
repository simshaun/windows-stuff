Import-Module posh-git
oh-my-posh init pwsh --config "E:\Google Drive\CLI\PowerShell\oh-my-posh.json" | Invoke-Expression

Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-Alias -Name pn -Value pnpm

<#
Command: dep5
Description: Run Deployer v5
Usage: dep5 deploy
#>
function dep5 {
  php "E:\Google Drive\CLI\dep5.phar" $args
}

<#
Command: dep
Description: Run Deployer
Usage: dep deploy
#>
function dep {
  php "E:\Google Drive\CLI\deployer.phar" $args
}

<#
Command: download
Description: Download a file
Usage: download https://example.com/foo.txt
Usage: download https://example.com/foo.txt newname.txt
#>
function download {
  param (
      [Parameter(Mandatory = $true, Position = 0)]
      [string]$Url,
      [Parameter(Mandatory = $false, Position = 1)]
      [string]$Output = $null
  )

  # Check if the output filename is provided; if not, generate one from the URL
  if (-not $Output) {
      $Output = [System.IO.Path]::GetFileName($Url)
  }

  try {
      # Download the file
      Invoke-WebRequest -Uri $Url -OutFile $Output

      # Print a message to indicate the file was downloaded successfully
      Write-Host "File downloaded successfully to $Output"
  }
  catch {
      # Print an error message
      Write-Host "An error occurred while downloading the file: $_"
  }
}


<#
Command: explore, exp
Description: Run explorer on the CWD or path
Usage: explore [optional folder path]
       exp [optional folder path]
#>
function explore {
  param (
    [string]$path = (Get-Location)
  )
  explorer $path
}

Set-Alias exp explore


<#
Command: getmip
Description: Get your current IP
Usage: getmip
#>
function getmip {
    $ipAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
    Write-Output $ipAddress
}


<#
Command: pq
Description: pngquant, overwrite file
Usage: pq foo.png
#>
function pq {
  pngquant.exe --force --ext .png $args
}

<#
Command: pstorm
Description: Open file or directory in PhpStorm
Usage: pstorm .
#>
function pstorm {
  $path = "D:\Jetbrains\PhpStorm\bin\phpstorm64.exe"
  if ([System.IO.File]::Exists($path)){
    & $Path $args
    return
  }

  $path = "E:\JetBrains\Toolbox\PhpStorm\bin\phpstorm64.exe"
  if ([System.IO.File]::Exists($path)){
    & $Path $args
    return
  }
}

<#
Command: proj
Description: Quickly CD to a project directory.
Usage: proj foo
#>

function proj {
  [CmdletBinding()]
  param( [Parameter()] [string]$Dir )
  Set-Location "E:\_projects\$Dir"
}
$scriptBlock = {
  param($commandName, $parameterName, $stringMatch)
  Get-ChildItem -Path "E:\_projects\$stringMatch*" -Directory | Select-Object -ExpandProperty Name
}
Register-ArgumentCompleter -CommandName proj -ParameterName Dir -ScriptBlock $scriptBlock

<#
Command: touch
Description: Create a new file or update the timestamp of an existing file.
Usage: touch test.txt
#>

function touch {
  param (
      [string]$FilePath
  )

  if (-not (Test-Path $FilePath)) {
      # If the file doesn't exist, create it
      New-Item -ItemType File -Path $FilePath | Out-Null
  } else {
      # If the file exists, update its timestamp
      (Get-Item $FilePath).LastWriteTime = Get-Date
  }

  $FilePath
}


<#
Command: work
Description: Quickly CD to a work directory.
Usage: work foo
#>

function work {
  [CmdletBinding()]
  param( [Parameter()] [string]$Dir )
  Set-Location "E:\work\$Dir"
}
$scriptBlock = {
  param($commandName, $parameterName, $stringMatch)
  Get-ChildItem -Path "E:\work\$stringMatch*" -Directory | Select-Object -ExpandProperty Name
}
Register-ArgumentCompleter -CommandName work -ParameterName Dir -ScriptBlock $scriptBlock


<#
Command: whatdaport
Description: Determine what process is using a port.
Usage: whatdaport 9000
#>
function whatdaport {
  [CmdletBinding()]
  param( [Parameter(Mandatory)] [int]$Port )
  $connection = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
  if ($connection) {
    (Get-Process -Id ($connection.OwningProcess)).Path
  } else {
    Write-Output "Nothing found using port $Port"
  }
}
# Disable TAB autocompletion
$scriptBlock = { param($commandName, $parameterName, $stringMatch) $null }
Register-ArgumentCompleter -CommandName whatdaport -ParameterName Port -ScriptBlock $scriptBlock


<#
Command: ga
Description: Add file(s)
Usage: ga test.txt
#>
function ga {
  git add $args
}


<#
Command: gc
Description: Commit
Usage: gc
#>
function gc {
  git commit --verbose $args
}


<#
Command: gca
Description: Commit all
Usage: gca
#>
function gca {
  git commit -a --verbose $args
}


<#
Command: gcm
Description: Commit with message
Usage: gcm "Test"
#>
function gcm {
  git commit -a --verbose $args
}


<#
Command: gcam
Description: Commit all with message
Usage: gcam "Test"
#>
function gcam {
  git commit -a -m $args
}


<#
Command: gd
Description: Show changes to working tree
Usage: gd
#>
function gd {
  git diff
}


<#
Command: gdl
Description: Show changed files in last commit
Usage: gdl
#>
function gdl {
  gll -1
}


<#
Command: gdlc
Description: Show changes in last commit
Usage: gdlc
#>
function gdlc {
  git diff --cached HEAD^
}


<#
Command: gll
Description: List commits and their changed files
Usage: gls
#>
function gll {
  git log --pretty=format:"%C(yellow)%h %cs%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat $args
}


<#
Command: gls
Description: List commits
Usage: gls
#>
function gls {
  git log --pretty=format:"%C(yellow)%h %cs%Cred%d %Creset%s%Cblue [%cn]" --decorate $args
}


<#
Command: glt
Description: Show last tag
Usage: glt
#>
function glt {
  git describe --tags --abbrev=0 $args
}


<#
Command: gpl
Description: git pull
Usage: gpl master origin
#>
function gpl {
  git pull $args
}


<#
Command: gpu
Description: git push
Usage: gpu master origin
#>
function gpu {
  git push $args
}


<#
Command: gput
Description: git push tags
Usage: gput
#>
function gput {
  git push --tags $args
}


<#
Command: gs
Description: git status
Usage: gs
#>
function gs {
  git status -s $args
}


<#
Command: gt
Description: git tag
Usage: gt
#>
function gt {
  git tag $args
}


<#
Command: gitskipped
Description: List skipped files in git
Usage: gitskipped
#>
function gitskipped {
  (git ls-files -v $args) -split "\r\n" | Select-String -Pattern '^S ' | ForEach-Object {
    Write-Output $_.Line.Substring(2)
  }
}


<#
Command: gitskip
Description: Mark file(s) as "skip-worktree" in git
Usage: gitskip .env
#>
function gitskip {
  git update-index --skip-worktree $args
}


<#
Command: gitunskip
Description: Unmark file(s) as "skip-worktree" in git
Usage: gitunskip .env
#>
function gitunskip {
  git update-index --no-skip-worktree $args
}


<#
Command: gitunskipall
Description: Unmark all skipped files in git
Usage: gitunskipall
#>
function gitunskipall {
  $files = @((git ls-files -v $args) -split "\r\n" | Select-String -Pattern '^S ' | ForEach-Object { $_.Line.Substring(2) })
  git update-index --no-skip-worktree $files
}


<#
Command: lg
Description: Open lazygit
Usage: lg
#>
function lg {
  lazygit $args
}


<#
Command: orientation
Description: Display orientiation metadata of an image from EXIF data
Usage: orientation image.jpg
#>
function orientation {
  exiv2 -pt $args
}


<#
PowerShell parameter completion shim for the Rush CLI
#>
Register-ArgumentCompleter -Native -CommandName rush -ScriptBlock {
  param($commandName, $commandAst, $cursorPosition)
  [string]$value = $commandAst.ToString()
  # Handle input like `rush install; rush bui` + Tab
  [int]$position = [Math]::Min($cursorPosition, $value.Length)

  rush tab-complete --position $position --word "$value" | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

<#
PowerShell parameter completion shim for the dotnet CLI
#>
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
  param($commandName, $wordToComplete, $cursorPosition)
  dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

# dotnet suggest shell start
if (Get-Command "dotnet-suggest" -errorAction SilentlyContinue)
{
    $availableToComplete = (dotnet-suggest list) | Out-String
    $availableToCompleteArray = $availableToComplete.Split([Environment]::NewLine, [System.StringSplitOptions]::RemoveEmptyEntries)

    Register-ArgumentCompleter -Native -CommandName $availableToCompleteArray -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)
        $fullpath = (Get-Command $commandAst.CommandElements[0]).Source

        $arguments = $commandAst.Extent.ToString().Replace('"', '\"')
        dotnet-suggest get -e $fullpath --position $cursorPosition -- "$arguments" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    }
}
else
{
    "Unable to provide System.CommandLine tab completion support unless the [dotnet-suggest] tool is first installed."
    "See the following for tool installation: https://www.nuget.org/packages/dotnet-suggest"
}

$env:DOTNET_SUGGEST_SCRIPT_VERSION = "1.0.2"
# dotnet suggest script end
