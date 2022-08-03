function Set-JBCustomFields {
    <#
    .SYNOPSIS
    Sets multiple custom field values in a ticket with one request

    .DESCRIPTION
    Sets multiple field values in a ticket with one request.  

    .PARAMETER ticketId
    ticketId. Which ticket do you want to update?

    .PARAMETER CustomFields
    HashTable of the custom fields and the value to set them to.  Keys must be the custom field's id. id should be prefixed with cf. ex cf123.
    For dropdowns pass the option ID. For dates pass date as a string in any format (???)
    Find the custom fields' ids or option ids by calling Get-JBTicketCustomFields -ReturnUnset

    .EXAMPLE
    Set-JBCustomFields -ticketId 1039 -CustomFields @{ cf1 = 3 }

    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$ticketId,
        [Parameter(Mandatory)]
        [HashTable]$CustomFields
    )

    $Body = @{
        "TicketId" = $ticketId
    }
    foreach ($CF in $CustomFields.GetEnumerator()) {
        if ($Cf.Key -match "^cf\d+$") {
            $Body.Add($cf.Key, $cf.Value)
        }elseif($Cf.Key -match "^\d+$") {
            $Body.Add("cf$($cf.Key)", $cf.Value)
        }
    }

    $Params = @{
        Api    = "SetCustomFields"
        Method = "POST"
        Body   = $Body
    }
    Invoke-JBMethod @params

    
}