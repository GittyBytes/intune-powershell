$ResolveWingetPath = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe"
    if ($ResolveWingetPath){
           $WingetPath = $ResolveWingetPath[-1].Path
    }
$wingetexe = "$ResolveWingetPath\winget.exe"

if (Test-path $wingetexe)
{ Write-host "Found Winget"}
