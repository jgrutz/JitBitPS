function New-JBTicket {
    <# 
    .SYNOPSIS
    Create a new ticket on JitBit

    .DESCRIPTION
    Creates a new ticket on JitBit by submitting a POST request to the api.  Optionally can create a ticket "on-behalf" of a user
    
    .LINK
    https://www.jitbit.com/helpdesk/helpdesk-api#/?id=ticket-post

    .OUTPUTS
    The created ticket id

    .PARAMETER Category
    CategoryId

    .PARAMETER Body
    The body of the ticket. Supports html

    .PARAMETER Subject
    The subject line of the ticket

    .PARAMETER PriorityId
        -1 low, 0 normal, 1 high, 2 critical

    .PARAMETER UserId
    To Create a ticket on-behalf of this user (requires technician permissions)

    .PARAMETER Tags
    Any tags to add to the ticket for cetegorization

    .PARAMETER Attachments
    The file paths to any attachments.  ex Get-Item -Path 'C:\temp\screenshot-123.png'
    The online gui supports multiple attachments but not sure if the api does or not

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$Category,
        [Parameter(Mandatory = $true)]
        [String]$Body,
        [Parameter(Mandatory = $true)]
        [String]$Subject,
        [Parameter(Mandatory = $false)]
        [ValidateRange(-1, 2)]
        [int]$PriorityId = 0,
        [Parameter(Mandatory = $false)]
        [int]$UserId,
        [Parameter(Mandatory = $false)]
        [String[]]
        $Tags,
        [Parameter(Mandatory = $false)]
        [String[]]
        $Attachments
    )

    Write-Output "Priority: $PriorityId"
    $Params = @{
        Api    = "ticket"
        Method = "POST"
    }

    $Form = @{
        Category   = $Category
        Body       = $Body
        Subject    = $Subject
        PriorityId = $PriorityId
    }
    if ($UserId) {
        $form.Add("UserId", $UserId)
    }
    if ($tags) {
        $form.add("tags", $tags -join ",")
    }

    if ($Attachments) {
        # TODO test this out.  File uploads are disabled in demo version i think
        $form.Add("uploadfile", $Attachments)
    }
    
    Invoke-JBMethod @Params -Form $form 
}