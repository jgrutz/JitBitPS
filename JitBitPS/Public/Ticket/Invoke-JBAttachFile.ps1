function Invoke-JBAttachFile {
    <# 
    .SYNOPSIS
    Allows you to download an individual file attachment

    .PARAMETER id
    Ticket id

    .PARAMETER uploadFile
    File to upload. 

    .OUTPUTS
    Outputs the file data. Capture to a variable or write to a file/stream

    .EXAMPLE
    $MyFile = Get-Item C:\temp\my-picture.jpg
    Invoke-JBAttachFile -id 123 -uploadFile $MyFile
    
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Parameter(Mandatory = $true)]
        [FileInfo] $uploadFile
    )

    $Params = @{
        Api    = "AttachFile"
        Method = "POST"
        Form   = [Collections.Hashtable]::New($PSBoundParameters)
    }

    Invoke-JBMethod @Params
}