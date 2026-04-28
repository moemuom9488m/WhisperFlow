@echo off
chcp 65001 >nul
title GPU Monitor (nvidia-smi)

echo GPU 監控開始，按 Ctrl+C 可停止。
echo.

where nvidia-smi >nul 2>&1
if errorlevel 1 (
    echo 找不到 nvidia-smi，請先安裝 NVIDIA Driver 並確認已加入 PATH。
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $gpu=@(nvidia-smi --query-gpu=name --format=csv,noheader)[0].Trim(); Write-Host ('監控GPU: '+$gpu); $fanRaw=@(nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits)[0].Trim(); if($fanRaw -eq 'N/A'){ Write-Host '風扇狀態: 驅動未提供風扇感測值'; } else { Write-Host '風扇狀態: 溫度低時 0%% 屬正常（零轉速待機）'; }; Write-Host ''; $header='風扇%% | GPU使用%% | 記憶體控制器%% | 已用顯存(MiB) | 總顯存(MiB) | 溫度(C) | SM時脈(MHz) | 功耗(W)'; Write-Host $header; Write-Host ('-' * $header.Length); while($true){ $line=@(nvidia-smi --query-gpu=fan.speed,utilization.gpu,utilization.memory,memory.used,memory.total,temperature.gpu,clocks.sm,power.draw --format=csv,noheader,nounits)[0]; $c=$line -split '\s*,\s*'; if($c.Count -ge 8){ '{0,4}%% | {1,7}%% | {2,13}%% | {3,12} | {4,12} | {5,7} | {6,10} | {7,7}' -f $c[0],$c[1],$c[2],$c[3],$c[4],$c[5],$c[6],$c[7] }; Start-Sleep -Seconds 1 }"

if errorlevel 1 (
    echo.
    echo 監控程序發生錯誤，請按任意鍵關閉視窗。
    pause >nul
)
