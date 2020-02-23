Set-Location C:\

Import-Alias D:\Dylan\Documents\WindowsPowerShell\alias.csv

$Shell = $Host.UI.RawUI
$Size = $Shell.WindowSize
$Size.Width=100
$Size.Height=25
$Shell.WindowSize = $Size
$Size = $Shell.BufferSize
$Size.Width=100
$Size.Height=5000
$Shell.BufferSize = $Size
Clear-Host

if($Host.UI.RawUI.WindowTitle -like "*administrator*")
{
	$Host.UI.RawUI.ForegroundColor = "Green"
	$Host.UI.RawUI.BackgroundColor = "Blue"
}

Import-Module 'D:\Projects\PowerShell\posh-git\src\posh-git.psd1'
