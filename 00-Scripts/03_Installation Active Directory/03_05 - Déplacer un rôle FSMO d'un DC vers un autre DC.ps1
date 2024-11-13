Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator


Move-ADDirectoryServerOperationMasterRole -Identity DC03 RIDMaster -Confirm:$false


Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator