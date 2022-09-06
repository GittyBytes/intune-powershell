$Apptodetect = "Notepad++.Notepad++"

<# FUNCTIONS #>

#Initialization
function Start-Init {

    #Config console output encoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
}

function Confirm_Winget_Install {
    if (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq "Microsoft.DesktopAppInstaller"}) {
        return $true
    }
    else {
        write-host "winget is not installed"
        return $false
    }
}


#Run Init Function
Start-Init

if (Confirm_Winget_Install) {
    $InstalledApp = & winget list --Id $AppToDetect --accept-source-agreements | Out-String
    if ($InstalledApp -match [regex]::Escape($AppToDetect)) {
    return "$AppToDetect is installed!"
    }
}