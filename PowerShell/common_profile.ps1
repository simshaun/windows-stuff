Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

function proj {
  [CmdletBinding()]
  param(
    [Parameter()]
    [string]$Dir
  )
  Set-Location "E:\_projects\$Dir"
}
$scriptBlock = {
  param($commandName, $parameterName, $stringMatch)
  Get-ChildItem -Path "E:\_projects\$stringMatch*" -Directory | Select-Object -ExpandProperty Name
}
Register-ArgumentCompleter -CommandName proj -ParameterName Dir -ScriptBlock $scriptBlock

function work {
  [CmdletBinding()]
  param(
    [Parameter()]
    [string]$Dir
  )
  Set-Location "E:\work\$Dir"
}
$scriptBlock = {
  param($commandName, $parameterName, $stringMatch)
  Get-ChildItem -Path "E:\work\$stringMatch*" -Directory | Select-Object -ExpandProperty Name
}
Register-ArgumentCompleter -CommandName work -ParameterName Dir -ScriptBlock $scriptBlock