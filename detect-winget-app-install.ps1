$Apptodetect = "7Zip.7Zip"

$InstalledApp = $(winget list --Id $AppToDetect --accept-source-agreements | Out-String)
if ($InstalledApp -match [regex]::Escape($AppToDetect)) {
    return "$AppToDetect is installed!"
    exit 0
    }else {
    write-host "$AppToDetect is not installed!"
    exit 1
}