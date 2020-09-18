$dir = "$HOME\Downloads"; 

while($true){
Start-Sleep -Seconds 2

$f = Get-ChildItem $dir -include *.ica | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if($f){

    (Get-Content $f).replace("TransportDriver=TCP/IP", "TransportDriver=UDP") | Set-Content $f
    (Get-Content $f).replace("DesktopViewer-ForceFullScreenStartup=true", "DesktopViewer-ForceFullScreenStartup=false") | Set-Content $f
    #(Get-Content $f).replace("HDXoverUDP=Off", "HDXoverUDP=On") | Set-Content $f
    $name = $f.FullName;

    powershell.exe "& '$name'"
    Start-Sleep -Seconds 2
    Remove-Item $f
    }
}
