
$mdp = ConvertTo-SecureString -AsPlainText "P@$$word123" -Force
Set-ADAccountPassword -Identity sleroy -Reset -NewPassword $mdp

