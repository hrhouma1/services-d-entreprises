
Get-ADComputer


Get-ADComputer -Filter *
Get-ADComputer -Filter * | select-object Name


Get-ADComputer -Filter * -Properties *


Get-ADComputer -Filter "  Enabled -eq '$true' "


Get-ADComputer -Filter "  Name -eq 'DC01' " 


Get-ADComputer -Filter "  Name -eq 'DC01' " -Properties *


Get-ADComputer -Filter "  Name -eq 'DC01' " -Properties OperatingSystem

Get-ADComputer -Filter "  OperatingSystem -like '*Server*' " -Properties OperatingSystem | Select-Object Name, OperatingSystem
