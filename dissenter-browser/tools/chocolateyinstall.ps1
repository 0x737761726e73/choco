$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://dissenter.com/dist/browser/0.66.99/dissenter-browser-v0.66.99.exe'
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64
 
  softwareName  = 'dissenter-browser*'
 
  checksum64    = '1d031b6bbe98d33b6d8487ff8dc981a1'
  checksumType64= 'md5'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs
