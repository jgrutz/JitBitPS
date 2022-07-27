function Set-JBTicket {
    <#
    .SYNOPSIS
    Change ticket parameters, one or many.

    .DESCRIPTION
    Change ticket parameters, one or many. The method allows editing your own tickets only (unless you're helpdesk administrator or technician)

    .PARAMETER id
    Ticket ID

    .PARAMETER CategoryId
    Ticket Category

    .PARAMETER priority
    -1 low, 0 normal, 1 high, 2 critical

    .PARAMETER date
    Ticket creation date

    .PARAMETER userId
    Ticket submitter's user ID

    .PARAMETER dueDate
    Due date of the ticket

    .PARAMETER assignedUserId
    Assigned technician's ID. Set to 0 (zero) to remove the currently assigned user.

    .PARAMETER timeSpentInSeconds
    Time spend on the ticket in seconds

    .PARAMETER statusId
    Ticket status ID. "Closed" id 3, "New" is 1, "In process" is 2. Check your custom status IDs in the admin areaor Get-JBStatusId

    .PARAMETER tags
    A list of tags to apply to the ticket. All existing tags will be removed

    .PARAMETER subject
    The ticket subject

    .PARAMETER body
    The ticket body


    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Parameter(Mandatory = $false)]
        [int]$CategoryId,
        [Parameter(Mandatory = $false)]
        [int]$priority,
        [Parameter(Mandatory = $false)]
        [DateTime]$date,
        [Parameter(Mandatory = $false)]
        [int]$userId,
        [Parameter(Mandatory = $false)]
        [DateTime]$dueDate,
        [Parameter(Mandatory = $false)]
        [int]$assignedUserId,
        [Parameter(Mandatory = $false)]
        [int]$timeSpentInSeconds,
        [Parameter(Mandatory = $false)]
        [int]$statusId,
        [Parameter(Mandatory = $false)]
        [String[]]$tags,
        [Parameter(Mandatory = $false)]
        [String]$subject,
        [Parameter(Mandatory = $false)]
        [String]$body
    )

    if ($PSBoundParameters['tags']) {
        $PSBoundParameters['tags'] -join ","
    }

    $body = $PSBoundParameters
    $Params = @{
        Api    = "UpdateTicket"
        Method = "POST"
        Body   = $body
    }

    Invoke-JBMethod @params
}