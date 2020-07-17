$dir = "C:\Users\rogoz\Downloads\*"; 
$f = Get-ChildItem $dir -include *.ica | Sort-Object LastWriteTime -Descending | Select-Object -First 1


(Get-Content $f).replace("TransportDriver=TCP/IP", "TransportDriver=UDP") | Set-Content $f
(Get-Content $f).replace("DesktopViewer-ForceFullScreenStartup=true", "DesktopViewer-ForceFullScreenStartup=false") | Set-Content $f
#(Get-Content $f).replace("HDXoverUDP=Off", "HDXoverUDP=On") | Set-Content $f
$name = $f.FullName;

powershell.exe -noexit "& '$name'"

Remove-Item $f
