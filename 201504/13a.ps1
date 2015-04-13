Import-Module -Name ActiveDirectory
Get-ADComputer ex2013-1 -Properties * | select *principal* | Format-List

PrincipalsAllowedToDelegateToAccount : { }
servicePrincipalName                 : {
    MSServerClusterMgmtAPI/EX2013-1, MSServerClusterMgmtAPI/EX2013-1.EX2013A.LAB,
                                    IMAP/EX2013-1, IMAP/EX2013-1.EX2013A.LAB...
}
ServicePrincipalNames                : {
    MSServerClusterMgmtAPI/EX2013-1, MSServerClusterMgmtAPI/EX2013-1.EX2013A.LAB,
                                    IMAP/EX2013-1, IMAP/EX2013-1.EX2013A.LAB...
}
UserPrincipalName                    :

$UPNs1 = $(Get-ADComputer ex2013-1 -properties * | select -ExpandProperty servicePrincipalName)

$UPNs2 = $(Get-ADComputer ex2013-1 -properties * | select -ExpandProperty servicePrincipalNames)

$IsEqual = [string]::Compare($UPNs1, $UPNs2, $True)

$IsEqual

0

$UPNs1

MSServerClusterMgmtAPI/EX2013-1
MSServerClusterMgmtAPI/EX2013-1.EX2013A.LAB
IMAP/EX2013-1
IMAP/EX2013-1.EX2013A.LAB
IMAP4/EX2013-1
IMAP4/EX2013-1.EX2013A.LAB
POP/EX2013-1
POP/EX2013-1.EX2013A.LAB
POP3/EX2013-1
POP3/EX2013-1.EX2013A.LAB
exchangeRFR/EX2013-1
exchangeRFR/EX2013-1.EX2013A.LAB
exchangeAB/EX2013-1
exchangeAB/EX2013-1.EX2013A.LAB
exchangeMDB/EX2013-1
exchangeMDB/EX2013-1.EX2013A.LAB
SMTP/EX2013-1
SMTP/EX2013-1.EX2013A.LAB
SmtpSvc/EX2013-1
SmtpSvc/EX2013-1.EX2013A.LAB
TERMSRV/EX2013-1
TERMSRV/EX2013-1.EX2013A.LAB
WSMAN/EX2013-1
WSMAN/EX2013-1.EX2013A.LAB
RestrictedKrbHost/EX2013-1
HOST/EX2013-1
RestrictedKrbHost/EX2013-1.EX2013A.LAB
HOST/EX2013-1.EX2013A.LAB

