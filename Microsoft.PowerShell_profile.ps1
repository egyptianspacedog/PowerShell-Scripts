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
}

Import-Module 'D:\Projects\PowerShell\posh-git\src\posh-git.psd1'

#COVID-19 UPDATER

$country = 'UK'
$space = ' '
$headers=@{
    'x-rapidapi-host' = 'coronavirus-monitor.p.rapidapi.com'
    'x-rapidapi-key'  = 'a8243928d7msh29aa15c95169597p16b354jsn1f442ebe12ac'
}
$Restparam = @{
    'uri' = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=$country"
    Method = 'Get'
    Headers = $headers
}
$response = Invoke-RestMethod @restparam
$recordDate = Get-Date $response.latest_stat_by_country.record_date
Write-Host "COVID-19 $Country Stats from $recordDate :" -ForegroundColor Red
Write-Host " "
Write-Host "Active: $($response.latest_stat_by_country.active_cases)"$space -ForegroundColor Magenta -NoNewline
Write-Host "Fatal: $($response.latest_stat_by_country.total_deaths)"$space -ForegroundColor DarkGray -NoNewline
Write-Host "Recovered: $($response.latest_stat_by_country.total_recovered)" -ForegroundColor Green

$restParam2 = @{
    'uri' = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php"
    Method = 'Get'
    Headers = $headers
}
$response2 = Invoke-RestMethod @restParam2
$recordDate2 = Get-Date $response2.worldstat.statistic_taken_at
Write-Host "Worldwide from $recordDate2" -ForegroundColor Red
Write-Host " "
Write-Host "Total Cases: $($response2.worldstat.total_cases)"$space -ForegroundColor Magenta -NoNewLine
Write-Host "Total Deaths: $($response2.worldstat.total_deaths)"$space -ForegroundColor DarkGray -NoNewLine
Write-Host "Recovered: $($response2.worldstat.total_recovered)" -ForegroundColor Green
Write-Host "New Cases: $($response2.worldstat.new_cases)"$space -ForegroundColor Magenta -NoNewLine
Write-Host "New Deaths: $($response2.worldstat.new_deaths)" -ForegroundColor DarkGray




