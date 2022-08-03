function Connect-JitBit {
    [CmdletBinding()]
    param (

        [Parameter(ParameterSetName = 'Connect with token', Mandatory = $false)]
        [Parameter(ParameterSetName = 'Connect with secure token', Mandatory)]
        [Uri]$Url,

        [Parameter(ParameterSetName = 'Connect with token', Mandatory)]
        [String]$Token,

        [Parameter(ParameterSetName = 'Connect with secure token', Mandatory)]
        [SecureString]$SecureToken
    )

    # TODO read the url as the username of the saved credential file
    PROCESS {
        switch ($PsCmdlet.ParameterSetName) {
            'Connect with token' {
                Write-Debug 'Connecting with Token'
                $JitBitPSSession.url = $url.AbsoluteUri.TrimEnd('/')
                if ($PSVersionTable.PSVersion -ge '7.0') {
                    $JitBitPSSession.Token = ConvertTo-SecureString -AsPlainText -String $Token
                }
                else {
                    $JitBitPSSession.Token = ConvertTo-SecureString -String $Token -AsPlainText -Force
                }
            }

            'Connect with secure token' {
                Write-Debug 'Connecting with secure token'
                $JitBitPSSession.url = $url.AbsoluteUri.TrimEnd('/')
                $JitBitPSSession.Token = $SecureToken
                
            }
        }

        Write-Debug "Site-url $($JitBitPSSession.url)"
        Write-Debug "Site Token: $($JitBitPSSession.Token)"

        if (-not (Test-JBConnection)) {
            Write-Output "Cannot verify connection to JitBit Helpdesk. Check url and provided api token"
        }
    }
}