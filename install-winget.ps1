#WebClient
$dc = New-Object net.webclient
$dc.UseDefaultCredentials = $true
$dc.Headers.Add("user-agent", "Inter Explorer")
$dc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")

#temp folder
$InstallerFolder = $(Join-Path $env:ProgramData CustomScripts)
if (!(Test-Path $InstallerFolder))
{
New-Item -Path $InstallerFolder -ItemType Directory -Force -Confirm:$false
}
	#Check Winget Install
	Write-Host "Checking if Winget is installed" -ForegroundColor Yellow
	If (Get-Command winget -errorAction SilentlyContinue) {
		Write-Host "WinGet is Installed" -ForegroundColor Green
	}Else 
		{
		#Download WinGet MSIXBundle
		Write-Host "Not installed. Downloading WinGet..." 
		$WinGetURL = "https://aka.ms/getwinget"
        $MicrosoftVCLibsURL = "https://github.com/WinRice/Files/raw/main/Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.Appx"
		$MicrosoftUIXamlURL = "https://github.com/WinRice/Files/raw/main/Microsoft.UI.Xaml.2.7_8wekyb3d8bbwe.Appx"
        $dc.DownloadFile($WinGetURL, "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle")
        $dc.DownloadFile($MicrosoftVCLibsURL, "$InstallerFolder\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.Appx")
        $dc.DownloadFile($MicrosoftUIXamlURL, "$InstallerFolder\Microsoft.UI.Xaml.2.7_8wekyb3d8bbwe.Appx")
		
		#Install WinGet MSIXBundle 
		Try 	{
			Write-Host "Installing MSIXBundle + deps for App Installer..."
			Add-AppxPackage -Path "$InstallerFolder\Microsoft.UI.Xaml.2.7_8wekyb3d8bbwe.Appx"
			Add-AppxPackage -Path "$InstallerFolder\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.Appx"
			Add-AppxPackage -Path "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
			Write-Host "Installed MSIXBundle for App Installer" -ForegroundColor Green
			}
		Catch {
			Write-Host "Failed to install MSIXBundle for App Installer..." -ForegroundColor Red
			} 
	
		#Remove WinGet MSIXBundle 
		#Remove-Item -Path "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -Force -ErrorAction Continue
		#remove-AppxPackage -Package Microsoft.VCLibs.140.00.UWPDesktop_14.0.30704.0_x64__8wekyb3d8bbwe
        #remove-AppxPackage -Package Microsoft.UI.Xaml.2.7_7.2109.13004.0_x64__8wekyb3d8bbwe
        #remove-AppxPackage -Package Microsoft.DesktopAppInstaller_1.18.2091.0_x64__8wekyb3d8bbwe
}