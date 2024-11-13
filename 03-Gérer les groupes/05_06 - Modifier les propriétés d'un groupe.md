
Get-ADGroup -identity GroupeTest1
Set-ADGroup -Identity GroupeTest1 -Description "Test description"


Set-ADGroup -Identity GroupeTest1 -GroupCategory Security -GroupScope Universal


Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"}


Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"; extensionName="deuxième modif"}


Set-ADGroup -Identity GroupeTest1 -Replace @{info="info modifiée "}


Set-ADGroup -Identity GroupeTest1 -Clear info


Get-ADGroup -Identity GroupeTest3 | Set-ADGroup -Clear member
