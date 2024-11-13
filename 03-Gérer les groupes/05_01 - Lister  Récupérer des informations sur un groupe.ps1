Get-ADGroup 

Get-ADGroup -Filter *

Get-ADGroup -Identity GroupeTest1

Get-ADGroup -Identity GroupeTest1 -Properties *


Get-ADGroup -Filter * -SearchBase "CN=Computers,DC=lab,DC=lan"


Get-ADGroup -Filter " GroupScope -eq 'DomainLocal'  " | Select-Object Name, GroupScope


Get-ADGroup -Filter " GroupScope -eq 'Global'  " | Select-Object Name, GroupScope


(Get-ADGroup -Filter *).count


Get-ADGroup -Filter * -Server paris.lab.lan