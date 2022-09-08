#Check Winget Install
Write-Host "Checking if Winget is installed" -ForegroundColor Yellow
$TestWinget = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq "Microsoft.DesktopAppInstaller"}
   If ([Version]$TestWinGet. Version -gt "2022.728.1938.0") {
     Write-Host "WinGet is Installed" -ForegroundColor Green
     exit 0
     } else {
     Write-Host "WinGet is Installed" -ForegroundColor Green
     exit 1
   }
