$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://dissenter.com/dist/browser/0.65.121/dissenter-browser-v0.65.121.exe'
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url64
 
  softwareName  = 'dissenter-browser*'
 
  checksum64    = '1df97461603321035968045159978303'
  checksumType64= 'md5'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs
