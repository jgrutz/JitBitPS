function Get-CustomFieldsForCategory {
    <# 
    .SYNOPSIS
    Gets all possible custom field available in this ticket category (along with their "option" for drop-down custom fields)

    .PARAMETER CategoryId
    Category ID

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$CategoryId
    )

    $Params = @{
        Api  = "CustomFieldsForCategory"
        Body = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}