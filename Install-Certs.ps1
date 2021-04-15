<#
    .Synopsis
        Installs DOD certs based on machine function.
    .NOTES
        Version:        1.0
        Author:         Robert Owens
        Creation Date:  01/05/2021
#>
    
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
