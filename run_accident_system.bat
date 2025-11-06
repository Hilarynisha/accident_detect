@echo off
title Accident Detection - YOLOv11 Setup & Run
echo -------------------------------------------
echo   🚀 Setting up YOLOv11 Accident System...
echo -------------------------------------------

REM Create venv if not exists
if not exist venv (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate venv
echo ✅ Activating environment...
call venv\Scripts\activate

REM Install required packages
echo 📥 Installing dependencies (please wait)...
pip install --upgrade pip
pip install streamlit ultralytics opencv-python deep_sort_realtime numpy pandas Pillow tqdm

REM Download YOLOv11 model if missing
echo 🔍 Checking YOLO model...
python - << EOF
from ultralytics import YOLO
import os
if not os.path.exists("yolo11n.pt"):
    print("⬇️ Downloading YOLOv11 model...")
    YOLO("yolo11n.pt")
else:
    print("✅ YOLOv11 model already exists.")
EOF

REM Run Streamlit App
echo 🚦 Launching Accident Detection App...
streamlit run app.py

pause
