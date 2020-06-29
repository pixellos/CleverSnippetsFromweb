$dir = "C:\Users\rogoz\Downloads\*"; 
$f = Get-ChildItem $dir -include *.ica  | Select-Object -First 1


## Get it faster
(Get-Content $f).replace("TransportDriver=TCP/IP", "TransportDriver=UDP") | Set-Content $f
## Get it only in one screen
#(Get-Content $f).replace("DesktopViewer-ForceFullScreenStartup=true", "DesktopViewer-ForceFullScreenStartup=false") | Set-Content $f
## Better skype, was working some time ago, now is not
#(Get-Content $f).replace("HDXoverUDP=Off", "HDXoverUDP=On") | Set-Content $f
$name = $f.FullName;

powershell.exe -noexit "& '$name'"

Remove-Item $f
