
New-ADObject -Name TestObjet -Description "Description Objet" -Type user


New-ADObject -Name TestObjet1 -Description "Description Objet" -Type computer


Rename-ADObject -Identity "CN=TestObjet,DC=lab,DC=lan" -NewName testobjet10


$Serveurs2003 = Get-ADObject -Filter "OperatingSystem -like '*Server 2003'"

foreach($Serveur in $Serveurs2003)
{
 
 $AncienNOM = $Serveur.Name
 $NouveauNom = "srv_$($AncienNOM)"

 Rename-ADObject -Identity $Serveur -NewName $NouveauNom

}
