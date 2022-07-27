function Test-JBConnection {
    
    $Params = @{
        Api    = "Authorization"
        Method = "POST"
    }
    
    $Response = Invoke-JBMethod @Params

    if ($Response) {
        Write-Debug "Connection to $($JitBitPSSession.url) successful"
        return $true
    }
    else {
        Write-Debug "Connection to $($JitBitPSSession.url) failed"
        return $false
    }
}