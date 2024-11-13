Get-Module -Name ActiveDirectory -ListAvailable
Get-Module -Name ADDSDeployment -ListAvailable
Get-Module -Name GroupPolicy -ListAvailable

Get-WindowsFeature



Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools


Get-Module -Name ActiveDirectory -ListAvailable
Get-Module -Name ADDSDeployment -ListAvailable
Get-Module -Name GroupPolicy -ListAvailable



Get-Command -Module ActiveDirectory | Measure-Object
Get-Command -Module ADDSDeployment | Measure-Object
Get-Command -Module GroupPolicy | Measure-Object

