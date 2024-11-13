
New-ADReplicationSite -Name "Paris"


New-ADReplicationSite -Name "Lyon" -AutomaticTopologyGenerationEnabled $true


Move-ADDirectoryServer -Identity "DC01" -Site "Paris"