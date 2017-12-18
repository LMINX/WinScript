#################################################################################
# !! Input server hostnames in c:\temp\servers.txt before you run below script!!#
###
###
$computers = Get-Content -path C:\temp\servers.txt
$password = Read-Host -prompt "Enter new password for user" -assecurestring
$decodedpassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
Foreach($computer in $computers)
{
 $computer
 $user = [adsi]"WinNT://$computer/rtladm,user"
 $user.SetPassword($decodedpassword)
 $user.SetInfo()
}
