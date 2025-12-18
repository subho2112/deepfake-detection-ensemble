

# Deepfake Detection Ensemble

## Overview

Deepfake technology leverages advances in generative AI to create highly realistic synthetic images and videos. While powerful, such technology poses serious risks to media integrity, security, and public trust.

This project presents a **lightweight deepfake detection prototype** that combines **face extraction**, **Vision Transformer–based feature analysis**, and an **ensemble strategy** to improve robustness across diverse manipulation techniques.

The system is intended for **research, academic demonstration, and experimentation**, and is not designed for production deployment.

---

## Key Features

* Face detection and cropping using **MTCNN**
* Dual-model feature extraction using pretrained **Vision Transformers**
* Ensemble-based prediction for improved reliability
* GPU-accelerated inference with CUDA
* Web-based user interface powered by **Gradio**
* Platform-agnostic execution (Local + Google Colab)

---

## How It Works

### 1. Face Extraction

Input images or video frames are processed using **MTCNN** to detect and crop facial regions. This ensures the models focus on manipulation-relevant areas rather than background noise.

### 2. Feature Extraction

Two complementary pretrained models from Hugging Face are used:

* **BEiT (Vision Transformer)**
  `microsoft/beit-base-patch16-224-pt22k-ft22k`
  Captures global semantic and structural cues.

* **DINOv2 (Self-supervised Vision Transformer)**
  `facebook/dinov2-base`
  Focuses on fine-grained texture and frequency-level artifacts.

### 3. Ensembling

The logits from both models are averaged, and a threshold is applied to produce a final **deepfake probability score**.
This ensemble approach reduces false positives and improves generalization across different deepfake generation methods.

---

## Setup Guide

### Prerequisites

* **Python** ≥ 3.9
* **CUDA-compatible GPU** (CUDA 11.8 recommended for best performance)
* **Operating System**: Linux (tested on Ubuntu 22.04), macOS, or Windows

---

## Installation

All platform-specific setup scripts are located inside the **`setup_guide/`** directory of this repository.

| Platform     | Script                          | Description                                                             |
| ------------ | ------------------------------- | ----------------------------------------------------------------------- |
| Linux / Unix | `setup_guide/setup_linux.sh`    | Creates a virtual environment, installs dependencies, and verifies CUDA |
| Windows      | `setup_guide/setup_windows.bat` | Windows-compatible setup with venv creation and dependency installation |
| macOS        | `setup_guide/setup_mac.sh`      | macOS-specific setup with Python and environment checks                 |

Please run the script corresponding to your operating system.

---

### Linux / Unix

```bash
git clone https://github.com/subho2112/deepfake-detection-ensemble.git
cd deepfake-detection-ensemble
bash setup_guide/setup_linux.sh
```

### Windows

```cmd
git clone https://github.com/subho2112/deepfake-detection-ensemble.git
cd deepfake-detection-ensemble
setup_guide\setup_windows.bat
```

### macOS

```bash
git clone https://github.com/subho2112/deepfake-detection-ensemble.git
cd deepfake-detection-ensemble
bash setup_guide/setup_mac.sh
```

All setup scripts will:

1. Create a `venv/` virtual environment
2. Install dependencies from `requirements.txt`
3. Verify CUDA-enabled PyTorch (if supported hardware is available)

---

## First-Run Model Initialization (Important)

This prototype loads **two large pretrained Vision Transformer models** from Hugging Face:

* `microsoft/beit-base-patch16-224-pt22k-ft22k`
* `facebook/dinov2-base`

### What to Expect

* On the **first run**, the models are **downloaded from Hugging Face and cached locally**
* Initialization may take **several minutes**, depending on network speed and hardware
* During this phase, the application may appear unresponsive — this is expected behavior

### Subsequent Runs

* Models are loaded from the local cache
* Startup time is significantly faster
* On **Google Colab**, models are re-downloaded each session unless persistent storage is used

### Cache Location

* Linux / macOS: `~/.cache/huggingface/`
* Google Colab: Temporary runtime storage

---

## Verify Installation

```bash
source venv/bin/activate
python -c "import torch; print('CUDA available:', torch.cuda.is_available())"
```

---

## Running the Prototype

### Local Execution

```bash
source venv/bin/activate
python app.py
```

A Gradio web interface will be launched.
Open the displayed URL in a browser, upload an image or video, and view the predicted deepfake probability.

> **Note:** This repository does not include a Jupyter notebook.

---

## Running on Google Colab (No Notebook Required)

Although no notebook is provided, the application can be executed directly in **Google Colab** as a standard Python project.

### Steps

1. Open [https://colab.research.google.com](https://colab.research.google.com) and create a new notebook
2. Enable GPU

   * Runtime → Change runtime type → Hardware accelerator → **GPU**
3. Clone the repository:

   ```bash
   !git clone https://github.com/subho2112/deepfake-detection-ensemble.git
   %cd deepfake-detection-ensemble
   ```
4. Install dependencies:

   ```bash
   !pip install -r requirements.txt
   ```
5. Run the application:

   ```bash
   !python3 deepfake.py
   ```

Gradio will generate a **public URL** in the output cell, which can be opened in a browser.

### Notes for Colab

* CUDA is enabled automatically with a GPU runtime
* Model downloads occur on each new session
* Uploaded files are not persistent across runtime resets
* Intended for **demonstration and experimentation only**

---

## Notes & Limitations

* GPU inference is strongly recommended; CPU inference is significantly slower
* Detection accuracy depends on face visibility and alignment
* This is a **prototype**, not a production-grade forensic system

---

## Academic Context

This project was developed as a **Minor (Mini) Project** as part of the undergraduate curriculum in **Computer Science / Information Technology**.

The objective of the project is to explore the **practical application of machine learning and computer vision techniques** in addressing real-world challenges, specifically the detection of AI-generated synthetic media (deepfakes).

The work focuses on:

* Understanding pretrained Vision Transformer architectures
* Integrating multiple models into a unified inference pipeline
* Evaluating the effectiveness of an ensemble-based approach
* Deploying a functional prototype with a user-friendly web interface

The project emphasizes **conceptual understanding, implementation skills, and experimentation**, rather than building a production-ready forensic system.

---

## Contributions

Contributions, improvements, and experiments are welcome.
Feel free to fork the repository or open pull requests.

