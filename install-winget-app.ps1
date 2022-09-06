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
    winget install $AppID -e --accept-source-agreements
}