# WhisperFlow: Video STT Processing Toolkit

[![Python](https://img.shields.io/badge/python-3.8+-blue?style=for-the-badge&logo=python)](https://www.python.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white)](https://pytorch.org/)
[![Faster Whisper](https://img.shields.io/badge/Model-Faster--Whisper-blueviolet?style=for-the-badge)](https://github.com/SYSTRAN/faster-whisper)
[![yt-dlp](https://img.shields.io/badge/Tools-yt--dlp-red?style=for-the-badge&logo=youtube)](https://github.com/yt-dlp/yt-dlp)
[![FFmpeg](https://img.shields.io/badge/Dependency-FFmpeg-007808?style=for-the-badge&logo=ffmpeg&logoColor=white)](https://ffmpeg.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

---

[English Version](./README_EN.md) 

## 📌 專案簡介 (Chinese)

**WhisperFlow** 是一個基於 `faster-whisper` 的自動化語音轉文字（STT）工具集。本專案提供高效的轉錄流程，支援多種輸出格式與模型快取管理。

> ⚠️ **隱私說明**：本專案不包含任何特定影片資訊，亦不記錄使用者隱私數據。

## ✨ 主要功能

- **多來源支援**：支援本地影片檔案及 YouTube 連結批次轉錄。
- **高效能模型**：整合 `faster-whisper` 提供極速推論。
- **自動化處理**：YouTube 連結透過 `urls.txt` 實現自動排程處理。
- **結構化輸出**：自動生成逐字稿（TXT）與字幕檔（SRT）。

## 🛠 路徑與處理機制 (Path Handling)

為了確保在 Windows 環境下的穩定性與靈活度，本專案採用以下路徑處理機制：

1.  **絕對路徑確保**：所有腳本均自動偵測 `Path.cwd()` 並轉換為**絕對路徑**，避免 Windows 權限、符號連結 (Symlink) 或執行目錄切換導致的檔案找不到問題。
2.  **音訊提取邏輯差異**：
    *   **YouTube 來源**：採用「先提取、後轉錄」機制。先使用 `yt-dlp` 下載並將音軌轉為 `input.mp3` 存於專案資料夾，以確保網路波動不影響模型執行，並方便日後更換模型重新轉錄。
    *   **本地影片**：採用「直接解碼」機制。`faster-whisper` 會直接讀取影片檔案流進行轉錄，無需額外佔用磁碟空間存儲中間音訊檔。
3.  **模型快取**：統一存放於根目錄的 `model_cache/`，支援多個腳本共用同一模型檔案，避免重複下載。

## 🚀 環境需求
- Python 3.8+
- 安裝套件：`pip install -r requirements.txt`
- 系統依賴：需要安裝 [FFmpeg](https://ffmpeg.org/) 並確保 `ffmpeg.exe` 可被偵測。

## 📄 授權協議
本專案採用 MIT License 授權。

