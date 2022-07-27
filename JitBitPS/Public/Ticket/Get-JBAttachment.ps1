function Get-JBAttachment {
    <# 
    .SYNOPSIS
    Allows you to download an individual file attachment

    .PARAMETER id
    file attachment id

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id
    )

    $Params = @{
        Api  = "attachment"
        Body = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}