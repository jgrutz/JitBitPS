function Set-JBCustomFields {
    <#
    .SYNOPSIS
    Sets multiple custom field values in a ticket with one request

    .DESCRIPTION
    Sets multiple field values in a ticket with one request


    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ticketId
    )

    # TODO I don't understand the API docs for this one. https://www.jitbit.com/helpdesk/helpdesk-api#/?id=setcustomfields-post
    
}