if (Get-AppxPackage -Name Microsoft.Winget.Source) {

return $true;

}else{

return $false;
}
