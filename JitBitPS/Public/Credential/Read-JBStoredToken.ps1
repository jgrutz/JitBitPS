function Read-JBStoredToken {
    <#
    .SYNOPSIS
    Retrieves a previously stored JitBit user token.

    .DESCRIPTION
    Retrieves a previously stored JitBit user Token. If no path is given, then a default path is attempted

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [String]$FilePath = (Get-JBDefaultTokenPath)
    )
    if(Test-Path $FilePath){
        Import-Clixml -Path $FilePath
    }
}