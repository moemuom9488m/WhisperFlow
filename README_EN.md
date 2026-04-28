# WhisperFlow: Video STT Processing Toolkit

[![Python](https://img.shields.io/badge/python-3.8+-blue?style=for-the-badge&logo=python)](https://www.python.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white)](https://pytorch.org/)
[![Faster Whisper](https://img.shields.io/badge/Model-Faster--Whisper-blueviolet?style=for-the-badge)](https://github.com/SYSTRAN/faster-whisper)
[![yt-dlp](https://img.shields.io/badge/Tools-yt--dlp-red?style=for-the-badge&logo=youtube)](https://github.com/yt-dlp/yt-dlp)
[![FFmpeg](https://img.shields.io/badge/Dependency-FFmpeg-007808?style=for-the-badge&logo=ffmpeg&logoColor=white)](https://ffmpeg.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

---
[中文版本](./README.md)

## 📌 Project Overview

**WhisperFlow** is an automated STT toolkit powered by `faster-whisper`. It provides efficient workflows with robust path handling and cache management.

> ⚠️ **Privacy Notice**: This repository does not contain any specific video details or personally identifiable information.

## ✨ Key Features

- **Multi-Source Support**: Batch transcribe local video files or YouTube URLs.
- **High Performance**: Leverages `faster-whisper` for ultra-fast inference.
- **Automated Scheduling**: Process YouTube links via `urls.txt`.
- **Structured Output**: Generates transcripts (TXT) and subtitles (SRT).

## 🛠 Path Handling & Processing Logic

For stability in Windows environments, the project implements the following logic:

1.  **Absolute Path Enforcement**: Scripts automatically resolve `Path.cwd()` to **absolute paths** to prevent issues related to Windows permissions or current directory context.
2.  **Transcription Strategy**:
    *   **YouTube Sources**: Uses a "Download-First" approach. `yt-dlp` extracts audio to `input.mp3` before transcription to ensure network stability and allow for re-transcription with different models.
    *   **Local Videos**: Uses a "Direct Stream" approach. `faster-whisper` decodes the video file directly in memory, saving disk space by avoiding intermediate audio files.
3.  **Model Cache**: Models are stored in `model_cache/` at the root, allowing multiple scripts to share the same weights.

## 🚀 Quick Start
- Python 3.8+
- Dependencies: `pip install -r requirements.txt`
- System Requirement: [FFmpeg](https://ffmpeg.org/)

## 📄 License
This project is licensed under the MIT License.

