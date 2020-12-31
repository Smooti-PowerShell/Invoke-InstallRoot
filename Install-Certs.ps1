Set-Location "C:\Program Files\DoD-PKE\InstallRoot"

# Check for new TAMP messages
.\InstallRoot.exe --update | Out-Null
$ProductType = (Get-WMIObject -Class win32_operatingsystem).producttype
if ($ProductType -eq 3) {
    .\InstallRoot.exe --insert --group DOD | Out-Null
}
else {
    .\InstallRoot.exe --insert --group DOD,ECA,JITC | Out-Null
}