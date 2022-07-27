<#
.DESCRIPTION
Try to make some functions to interact with the JitBit API


#>



$JitBitPSSession = [Ordered]@{
    Url   = $null
    Token = $null
}

New-Variable -Name JitBitPSSession -Value $JitBitPSSession -Scope Global -Force

#Get public and private functino definition files
$Public = @(Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -Recurse -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -Recurse -ErrorAction SilentlyContinue)

#Dot source the files
foreach($import in @($Public + $Private)){
    try{
        . $Import.FullName
    }catch {
        Write-Error -Message "Failed to import funciton $($Import.FullName): $_"
    }
}

#Export the public functions
Export-ModuleMember -Function $Public.Basename