function Invoke-JBMethod {
    
    <#
    .SYNOPSIS 
    Helper method for calling JitBit API

    .DESCRIPTION
    Helper method for calling Invoke-RestMethod with correct authentication and short urls

    .PARAMETER Api
    What Api endpoint are we calling?

    .PARAMETER Method
    Get, post, etc. Defaults to GET if not specified

    .PARAMETER Body
    Body of the request. Could be a hastable of parameters such as
        $Body = @{userid=123,name='John',lastname='Doe'}

    .PARAMETER Form
    Use when using POST with a multi part form

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String]$Api,
        [Parameter(Mandatory = $False)]
        [String]$Method = "GET",

        [hashtable]$Body,
        # https://www.seobility.net/en/wiki/GET_Parameters
        # [hashtable]$GetParameters,
        [hashtable]$Form
    )


    $Params = @{
        URI            = "$($JitBitPSSession.url)/Api/$Api"
        Authentication = "Bearer"
        Token          = $JitBitPSSession.Token
        Method         = $Method
    }

    if ($Form) {
        $Params.Add("Form", $Form)
    }

    if ($body) {
        $Params.Add("Body", $Body)
    }

    
    Invoke-RestMethod @params
}