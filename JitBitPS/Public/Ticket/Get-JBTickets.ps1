function Get-JBTickets {
    <#
    .SYNOPSIS
    Gets a list of tickets the current user has permissions to see.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("All", "Unanswered", "Unclosed", "HandledByMe")]
        [String]$Mode = "All", 
        [Parameter(Mandatory = $false)]
        [int]$CategoryId, 
        [Parameter(Mandatory = $false)]
        [int]$SectionId, 
        [Parameter(Mandatory = $false)]
        [int[]]$StatusId, 
        [Parameter(Mandatory = $false)]
        [int]$FromUserId, 
        [Parameter(Mandatory = $false)]
        [int]$FromCompanyId, 
        [Parameter(Mandatory = $false)]
        [int]$HandledByUserId, 
        [Parameter(Mandatory = $false)]
        [String]$TagName, 
        [Parameter(Mandatory = $false)]
        [DateTime]$DateFrom, 
        [Parameter(Mandatory = $false)]
        [DateTime]$DateTo, 
        [Parameter(Mandatory = $false)]
        [DateTime]$UpdatedFrom, 
        [Parameter(Mandatory = $false)]
        [DateTime]$UpdatedTo, 
        [Parameter(Mandatory = $false)]
        [int]$DueInDays, 
        [Parameter(Mandatory = $false)]
        [bool]$IncludeCustomFields, 
        [Parameter(Mandatory = $false)][ValidateRange(1, 300)]
        [int]$Count, 
        [Parameter(Mandatory = $false)]
        [int]$Offset
    )

    $Params = @{
        Api = "tickets"
    }

    # Change any DateTime objects to iso dates
    if ($PSBoundParameters) {
        $Body = $PSBoundParameters
        [String[]] $keys = $body.Keys
        for ($ctr = 0; $ctr -lt $Body.Count; $ctr ++) {
            if ($body[$Keys[$ctr]] -is [DateTime]) {
                Write-Output "Modifying index $ctr : $($body[$Keys[$ctr]])"
                $body[$Keys[$ctr]] = $body[$Keys[$ctr]].ToString("yyyy-MM-dd")
            }
        }
    
        $Params.Add("Body", $Body)
    }
    
    Invoke-JBMethod @params
}