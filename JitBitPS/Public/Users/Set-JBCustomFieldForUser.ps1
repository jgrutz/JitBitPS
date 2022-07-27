function Set-JBCustomFieldForUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$userId,
        [Parameter(Mandatory = $true)]
        [int]$fieldId,
        [Parameter(Mandatory = $true)]
        [String]$Value
    )

    $Params = @{
        Api    = "SetCustomFieldForUser"
        Method = "POST"
        Body   = $PSBoundParameters
    }
            
    Invoke-JBMethod @Params
}