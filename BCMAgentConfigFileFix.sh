#!/bin/sh 
pwsh
#Variables
$path = "/usr/local/bmc-software/client-management/client/etc/mtxagent.ini"

#Certificate Authority fix
$text = (Get-Content -Path $path -ReadCount 0) -join "`n"
$text -replace 'CertAuth=', 'CertAuth=bcm' | Set-Content -Path $path
#If config file already has correct value, this fixes the previous command to add it
$text = (Get-Content -Path $path -ReadCount 0) -join "`n"
$text -replace 'CertTrusted=', 'CertTrusted=bcm' | Set-Content -Path $path

#Certificate Trusted fix
$text = (Get-Content -Path $path -ReadCount 0) -join "`n"
$text -replace 'CertAuth=bcmbcm', 'CertAuth=bcm' | Set-Content -Path $path
#If config file already has correct value, this fixes the previous command to add it
$text = (Get-Content -Path $path -ReadCount 0) -join "`n"
$text -replace 'CertTrusted=bcmbcm', 'CertTrusted=bcm' | Set-Content -Path $path
