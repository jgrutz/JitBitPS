function Invoke-JBAttachFile {
    <# 
    .SYNOPSIS
    Allows you to download an individual file attachment

    .PARAMETER id
    Ticket id

    .PARAMETER uploadFile
    File to upload. # TODO doc says file data but I think Invoke-RestMethod wants a file path.

    .OUTPUTS
    Outputs the file data. Capture to a variable or write to a file/stream

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Parameter(Mandatory = $true)]
        [String]$uploadFile
    )

    $Params = @{
        Api    = "AttachFile"
        Method = "POST"
        Form   = $PSBoundParameters
    }

    Invoke-JBMethod @Params
}