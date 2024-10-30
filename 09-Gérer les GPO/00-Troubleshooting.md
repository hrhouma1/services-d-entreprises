# Troubleshooting

### Partie 01
```powershell
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
Get-Module -ListAvailable | Where-Object { $_.Name -eq "GroupPolicy" }
Import-Module GroupPolicy
```

### Partie 02

```powershell
Get-Module -ListAvailable
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned
Install-WindowsFeature GPMC
```
