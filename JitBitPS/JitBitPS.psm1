<#
.DESCRIPTION
PowerShell API to interact with the JitBit Helpdesk API

#>

#Get public and private function definition files
$Public = @(Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -Recurse -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -Recurse -ErrorAction SilentlyContinue)

Write-Verbose "PScript Root: $PSScriptRoot  "
Write-Verbose "Private Function files:"
$Private | ForEach-Object { Write-Verbose $_ }
Write-Verbose "Public function files"
$Public| ForEach-Object { Write-Verbose $_ }

#Dot source the files
foreach ($import in @($Public + $Private)) {
    try {
        . $Import.FullName
        Write-Verbose $Import.FullName
    }
    catch {
        Write-Error -Message "Failed to import funciton $($Import.FullName): $_"
    }
}

#Export the public functions
Export-ModuleMember -Function $Public.Basename

$JitBitPSSession = [Ordered]@{
    Url   = $null
    Token = $null
}

New-Variable -Name JitBitPSSession -Value $JitBitPSSession -Scope Script -Force