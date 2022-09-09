#Check Winget Install
Write-Host "Checking if Winget is installed" -ForegroundColor Yellow
   If (Get-Command winget -errorAction SilentlyContinue) {
     Write-Host "WinGet is Installed" -ForegroundColor Green
     exit 0
     } else {
     Write-Host "WinGet is not Installed" -ForegroundColor Green
     exit 1
   }
