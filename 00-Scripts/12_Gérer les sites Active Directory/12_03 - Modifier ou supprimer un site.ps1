
Set-ADReplicationSite -Identity Paris -Description "Test modification site"


Remove-ADReplicationSite -Identity "Lyon" -Confirm:$false