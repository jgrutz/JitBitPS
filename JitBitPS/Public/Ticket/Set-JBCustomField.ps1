function Set-JBCustomField {

    <#
    .SYNOPSIS
    Sets custom field value in a ticket

    .DESCRIPTION
    Sets custom field value in a ticket

    .PARAMETER TicketId
    Ticket ID

    .PARAMETER fieldId
    Custom Field Id

    .PARAMETER Value
    Value as String. For checkboxes pass true or false. For dropdowns pass the option ID. For dates pass date as a string in any format.

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TicketId,
        [Parameter(Mandatory = $true)]
        [int]$fieldId,
        [Parameter(Mandatory = $true)]
        [String]$Value
    )

    $params = @{
        Api    = "SetCustomField"
        Method = "POST"
        $Body  = $PSBoundParameters
    }

    Invoke-JBMethod @params
}