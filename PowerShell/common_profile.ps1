Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme "E:\Google Drive\CLI\PowerShell\oh-my-posh.json"

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
Command: gitskipped
Description: List skipped files in git
Usage: gitskipped
#>
function gitskipped {
  [CmdletBinding()]
  param( [Parameter()] [string]$EmptyPath )
  (git ls-files -v) -split "\r\n" | Select-String -Pattern '^S ' | ForEach-Object {
    Write-Output $_.Line.Substring(2)
  }
}
# Disable TAB autocompletion
$scriptBlock = { param($commandName, $parameterName, $stringMatch) $null }
Register-ArgumentCompleter -CommandName gitskipped -ParameterName EmptyPath -ScriptBlock $scriptBlock


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
  [CmdletBinding()]
  param( [Parameter()] [string]$EmptyPath )
  (git ls-files -v) -split "\r\n" | Select-String -Pattern '^S ' | ForEach-Object {
    $file = $_.Line.Substring(2)
    git update-index --no-skip-worktree $file
  }
}
# Disable TAB autocompletion
$scriptBlock = { param($commandName, $parameterName, $stringMatch) $null }
Register-ArgumentCompleter -CommandName gitunskipall -ParameterName EmptyPath -ScriptBlock $scriptBlock
