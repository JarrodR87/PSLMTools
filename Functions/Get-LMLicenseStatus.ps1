function Get-LMLicenseStatus {
    <#
        .SYNOPSIS
            Checks LM License Status using LMTools lmutil.exe
        .DESCRIPTION
            Runs lmutil.exe lmstat -a with no parameter, or checks the specified License file with a given parameter
        .PARAMETER LicenseLocation
            License File Served by LMTools like 99999@TestServer
        .EXAMPLE
            Get-LMLicenseStatus
        .EXAMPLE
            Get-LMLicenseStatus -LicenseLocation 99999@TestServer
    #>
    [CmdletBinding()]
    Param(
        [Parameter()]$LicenseLocation
    ) 
    BEGIN { 
        $LMutilEXE = Join-Path $PSScriptRoot "lmutil.exe"
    } #BEGIN

    PROCESS {
        if ($NULL -eq $LicenseLocation) {
            $LicenseCheck = $LMutilEXE + ' lmstat -a'
        }
        else {
            $LicenseCheck = $LMutilEXE + ' lmstat -a -c ' + $LicenseLocation
        }
        
        Invoke-Expression $LicenseCheck -OutVariable output
    } #PROCESS

    END { 

    } #END

} #FUNCTION