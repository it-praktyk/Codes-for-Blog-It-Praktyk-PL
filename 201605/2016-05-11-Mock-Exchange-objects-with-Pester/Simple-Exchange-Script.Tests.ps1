Import-Module Pester

Import-Module C:\Users\Wojtek\Documents\Scripts\1-MyOnGitHub\Pester-ExchangeServer\Functions\New-MockedExchangeServer.ps1 -Force

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Simple-Exchange-Script" {
    
    Context -Name 'Server is CAS' {
        
        function Get-ExchangeServer { }
        
        Mock -CommandName Get-ExchangeServer -MockWith { New-MockedExchangeServer -IsClientAccessServer $true }
        
        It "Server is CAS" {
            
            Simple-Exchange-Script | Should Be "The server is Client Access Server"
            
        }
        
    }
}
