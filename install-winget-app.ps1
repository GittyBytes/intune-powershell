[CmdletBinding()]
param(
    [Parameter(Mandatory = $True, ParameterSetName = "AppID")] [String[]] $AppID
)

<# FUNCTIONS #>

#Initialization
function Start-Init {

    #Config console output encoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
}

#function Confirm_Winget_Install {
#    if (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq "Microsoft.DesktopAppInstaller"}) {
#        return $true
#    }
#    else {
#        write-host "winget is not installed"
#        exit 1
#    }
#}


#Run Init Function
Start-Init

#if (Confirm_Winget_Install) {
    $InstalledApp = & winget list --Id $AppID --accept-source-agreements | Out-String
    if (!($InstalledApp -match [regex]::Escape($AppID))) {
        write-host "$AppID is not installed, starting installation"
        winget source update
        winget install $AppID -e --accept-source-agreements
    }
    $InstalledApp = & winget list --Id $AppID --accept-source-agreements | Out-String
    if ($InstalledApp -match [regex]::Escape($AppID)) {
    return "$AppID is succesfully installed!"
    exit 0
    }else {
    write-host "$AppID is not succesfully installed!"
    exit 1
    }
#}