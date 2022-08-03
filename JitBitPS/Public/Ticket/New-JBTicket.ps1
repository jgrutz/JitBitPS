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

    .PARAMETER CategoryID
    CategoryId.  use Get-JBCategories to find options

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

    .EXAMPLE
    $Attachments = @( (Get-Item C:\temp-screenshot-123.png), (Get-Item C:\temp-screenshot-456.png))
    New-JBTicket -categoryid 2 -body "This should have 2 attachments" -Subject "[Test]Multiple Attachments" -PriorityId 2 -Attachments $Attachments
    
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$CategoryID,
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
        [IO.FileInfo[]]
        $Attachments
    )
    

    Write-Output "Priority: $PriorityId"
    $Params = @{
        Api    = "ticket"
        Method = "POST"
    }

    $Form = @{
        CategoryID   = $CategoryID
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
        $form.Add("uploadfile", $Attachments)
    }
    
    $ResultArray = Invoke-JBMethod @Params -Form $form 
    
    $Result = @{}
    foreach($ResultEntry in $ResultArray){
        if($ResultEntry -match "(.*): (.*)"){
            Write-Host "Key: $($Matches[1])"
            Write-Host "Value: $($Matches[2])"
            $Result.Add($Matches[1],$Matches[2])
        }elseif($ResultEntry -match "^\d+$"){
            Write-Host "Key: id"
            Write-Host "Value: $($Matches[0])"
            $Result.Add("id",$Matches[0])
        }
    }
    
    return $Result
}