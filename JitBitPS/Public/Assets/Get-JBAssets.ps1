function Get-JBAssets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [int]$page,
        [Parameter(Mandatory = $false)]
        [int]$assignedToUserId,
        [Parameter(Mandatory = $false)]
        [int]$assignedToCompanyId,
        [Parameter(Mandatory = $false)]
        [int]$assignedToDepartmentId
    )

    $Params = @{
        Api = "Assets"
    }

    if ($PSBoundParameters) {
        $Params.Add("Body", $PSBoundParameters)
    }

    Invoke-JBMethod @Params
}