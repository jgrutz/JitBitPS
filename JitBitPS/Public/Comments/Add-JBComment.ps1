function Add-JBComment {
    <#
    .SYNOPSIS
    Posts a comment to a ticket

    .PARAMETER Id
    ticket id

    .PARAMETER body
    Comment body

    .PARAMETER forTechsOnly
    If this comment is for techs only

    .PARAMETER isSystem
    If this is a "system" comment (shown in grey)

    .PARAMETER recipientIds
    A list of subscriber user IDs to send the comment notification to. By default it is sent to all subscribers

    .PARAMETER fromUserId
    The userId from which to post a comment from if we are posting as someone else.  Requires Administrator role in JitBit

    #>
        
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Id,
        [Parameter(Mandatory = $true)]
        [int]$Body,
        [Parameter()]
        [Switch]$forTechsOnly,
        [Parameter()]
        [Switch]$isSystem,
        [Parameter(Mandatory = $false)]
        [int[]]$recipientIds,
        [Parameter(Mandatory = $false)]
        [int]$fromUserId
    )

    if ($PSBoundParameters['recipientIds']) {
        $PSBoundParameters['recipientIds'] = $PSBoundParameters['recipientIds'] -join ","
    }

    $Params = @{
        Api    = "comment"
        Method = "POST"
        Form   = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
    
}