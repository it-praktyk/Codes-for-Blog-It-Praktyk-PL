function Simple-Exchange-Script {
    
    $TestExchangeServer = Get-ExchangeServer
    
    if ($TestExchangeServer.IsClientAccessServer) {
        
        Return "The server is Client Access Server"
        
    }
    else {
        
        Return "The server is not Client Access Server"
        
    }
    
}
