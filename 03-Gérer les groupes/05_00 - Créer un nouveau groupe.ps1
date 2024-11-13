New-ADGroup -Name GroupeTest1 -GroupScope Global -GroupCategory Security


New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2" 


New-ADGroup -Name GroupeTest3 -GroupScope DomainLocal -GroupCategory Distribution -Path "CN=Computers,DC=lab,DC=lan"


New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2" -Server paris.lab.lan


New-ADGroup -Name GroupeTest20 -GroupScope DomainLocal -GroupCategory Security -OtherAttributes @{info="Test info groupe"}


$Groupes = Import-Csv -Path 'C:\groupes ad.csv' -Delimiter ";" -Encoding UTF8


foreach($Groupe in $Groupes)
{


 if($Groupe.Domaine -eq "paris.lab.lan")
 {

  $EmplacementOU = "OU=Agences,DC=Paris,DC=lab,DC=lan"

 }
 elseif($Groupe.Domaine -eq "lab.lan")
 {
    
    $EmplacementOU = "OU=Agences,DC=lab,DC=lan"

 }

 New-ADGroup -Name $Groupe.NomGroupe `
            -GroupCategory $Groupe.TypeGroupe `
            -GroupScope $Groupe.EtendueGroupe `
            -Server $Groupe.Domaine `
            -Path $EmplacementOU


}
