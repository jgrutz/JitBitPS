function Get-JBTechsForCategory {
    
    <#
    
    .SYNOPSIS 
    Gets all possible assignees for a category

    .DESCRIPTION
    Gets all possible assignees for a category
    
    .PARAMETER CategoryId
    Which category are we querying?

    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        [int]$CategoryId
    )

    $Body = @{
        id = $CategoryId
    }

    $Params = @{
        Api  = "TechsForCategory"
        Body = $body
    }

    Invoke-JBMethod @params

}