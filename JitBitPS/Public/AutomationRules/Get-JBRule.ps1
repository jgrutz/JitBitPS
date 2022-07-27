function Get-JBRule {
    <#
    .SYNOPSIS
    Returns a particular automation rule

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Id
    )

    $Params = @{
        Api = "Rule/$id"
    }

    Invoke-JBMethod @Params
}