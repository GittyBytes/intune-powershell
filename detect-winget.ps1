#Check Winget Install
$TestWinget = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq "Microsoft.DesktopAppInstaller"}
If ([Version]$TestWinGet. Version -gt "2022.728.1938.0")
{
Write-Host "WinGet is Installed" -ForegroundColor Green
}