if (Get-AppxPackage -Name Microsoft.DesktopAppInstaller) {

  return $true;

}else{
  $releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $releases = Invoke-RestMethod -uri "$($releases_url)"
  $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith("msixbundle") } | Select -First 1
  Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
  Add-AppxPackage -Path "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/e700ed37-7b26-4e1d-b5e2-ba28047c6074?P1=1662324695&P2=404&P3=2&P4=Tti5OaWtsRyO1eiXVKNu6X0li3RqeqelhT4YjS21VM4FwUT6YyiGtnZJsFoKnonXn%2frkq7uzTIIBKspX8Esd6A%3d%3d"	
  Add-AppxPackage -Path $latestRelease.browser_download_url
  if (Get-AppxPackage -Name Microsoft.DesktopAppInstaller) {

  return $true;
  }else{

  return $false;
  }

}