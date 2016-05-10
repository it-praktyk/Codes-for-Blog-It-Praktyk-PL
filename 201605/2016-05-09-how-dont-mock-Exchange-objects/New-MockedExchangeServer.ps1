<#
	.SYNOPSIS
		Function intended to create ExchangeServer object to use with Mock in Pester

        THIS FUNCTION DOESN'T WORK - IT IS EXAMPLE HOW YOU CAN'T MOCK !
	
	.DESCRIPTION
		Function intended to create ExchangeServer object to use with Mock in Pester.
	
	.PARAMETER Name
		Name of Exchange server.
	
	.PARAMETER AdminDisplaVersion
		Value for AdminDisplaVersion .
	
	.PARAMETER IsClientAccessServer
		Set to true if server has installed Client Access Role.
	
	.PARAMETER IsFrontendTransportServer
		Set to true if server has installed Client Access Role.
	
	.PARAMETER IsHubTransportServer
		Set to true if server has installed Mailbox Role.
	
	.PARAMETER IsMailboxServer
		Set to true if server has installed Mailbox Role.
	
	.PARAMETER IsUnifiedMessagingServer
		Set to true if server has installed Mailbox Role.
	
	.PARAMETER IsEdgeServer
		Set to true if a server is a Edge.
	
	.EXAMPLE
		PS C:\> New-MockedExchangeServer
	
	.NOTES
    AUTHOR: Wojciech Sciesinski, wojciech[at]sciesinski[dot]net
    KEYWORDS: PowerShell
   
    VERSIONS HISTORY
    0.1.0 -  2016-05-08 - initial version what doesn't work
    
    LICENSE
	Copyright (c) 2016 Wojciech Sciesinski
    This function is licensed under The MIT License (MIT)
    Full license text: https://opensource.org/licenses/MIT
		
#>
function New-MockedExchangeServer {
    [CmdletBinding(DefaultParameterSetName = 'IsNonEdgeServer')]
    [OutputType('Microsoft.Exchange.Data.Directory.Management.ExchangeServer')]
    param (
        [Parameter(ParameterSetName = 'IsEdgeServer',
                   ValueFromPipelineByPropertyName = $true)]
        [Parameter(ParameterSetName = 'IsNonEdgeServer',
                   ValueFromPipelineByPropertyName = $true)]
        [String]$Name = 'EX-1',
        [Parameter(ParameterSetName = 'IsEdgeServer')]
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [String]$AdminDisplaVersion = 'Version 15.0 (Build 1178.4)',
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [bool]$IsClientAccessServer = $true,
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [bool]$IsFrontendTransportServer = $true,
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [bool]$IsHubTransportServer = $true,
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [bool]$IsMailboxServer = $true,
        [Parameter(ParameterSetName = 'IsNonEdgeServer')]
        [bool]$IsUnifiedMessagingServer = $true,
        [Parameter(ParameterSetName = 'IsEdgeServer')]
        [ValidateSet($true)]
        [bool]$IsEdgeServer
    )
    
    Begin {
        
    }
    Process {
        
        $ExchangeServer = New-Object -TypeName Microsoft.Exchange.Data.Directory.Management.ExchangeServer
        
        $ExchangeServer.Name = $Name
        $ExchangeServer.AdminDisplayVersion = $AdminDisplaVersion
        
        switch ($PsCmdlet.ParameterSetName) {
            'IsEdgeServer' {
                $ExchangeServer.IsEdgeServer = $true
                $ExchangeServer.IsClientAccessServer = $false
                $ExchangeServer.IsFrontendTransportServer = $false
                $ExchangeServer.IsHubTransportServer = $false
                $ExchangeServer.IsMailboxServer = $false
                $ExchangeServer.IsUnifiedMessagingServer = $false
            }
            
            'IsNonEdgeServer' {
                
                $ExchangeServer.IsEdgeServer = $false
                $ExchangeServer.IsClientAccessServer = $IsClientAccessServer
                $ExchangeServer.IsFrontendTransportServer = $IsFrontendTransportServer
                $ExchangeServer.IsHubTransportServer = $IsHubTransportServer
                $ExchangeServer.IsMailboxServer = $IsMailboxServer
                $ExchangeServer.IsUnifiedMessagingServer = $IsUnifiedMessagingServer
                
            }
        }
        
    }
    End {
        
        Return $ExchangeServer
        
    }
}


