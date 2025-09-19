<div align="center">

# 🎬➡️🎵 Video to Audio Converter

[![Python](https://img.shields.io/badge/Python-3.7%2B-blue?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![PyQt5](https://img.shields.io/badge/PyQt5-GUI-green?style=for-the-badge&logo=qt&logoColor=white)](https://pypi.org/project/PyQt5/)
[![MoviePy](https://img.shields.io/badge/MoviePy-Video%20Processing-red?style=for-the-badge&logo=video&logoColor=white)](https://pypi.org/project/moviepy/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](https://opensource.org/licenses/MIT)

![GitHub stars](https://img.shields.io/github/stars/juansilvadesign/video-to-audio?style=social)
![GitHub forks](https://img.shields.io/github/forks/juansilvadesign/video-to-audio?style=social)
![GitHub issues](https://img.shields.io/github/issues/juansilvadesign/video-to-audio?style=social)

*A powerful, user-friendly Python application for seamless video-to-audio conversion* 🎯

</div>

---

## 📋 Overview

**Video to Audio Converter** is an intuitive Python application that enables users to effortlessly convert video files into high-quality audio formats including MP3, WAV, and AAC. Built with modern GUI components and featuring batch processing capabilities, customizable bitrates, and real-time progress tracking for an optimal user experience.

## ✨ Features

<table>
<tr>
<td>

### 🎬 Video Support
- **MP4**, **AVI**, **MOV**, **MKV** formats
- Batch processing capability
- Multiple file selection

</td>
<td>

### 🎵 Audio Output
- **MP3**, **WAV**, **AAC** formats
- Customizable bitrates (64-320 kbps)
- High-quality audio extraction

</td>
</tr>
<tr>
<td>

### 🖥️ User Interface
- Modern PyQt5 GUI
- Intuitive button icons
- Clean, professional design

</td>
<td>

### 📊 Progress Tracking
- Real-time progress bar
- Percentage completion display
- Status notifications

</td>
</tr>
</table>

### 🔥 Key Highlights
- 🚀 **Fast Conversion**: Optimized processing engine
- 📁 **Custom Output**: Choose your preferred save location
- 🔄 **Batch Processing**: Convert multiple files simultaneously
- 💾 **Memory Efficient**: Smart resource management
- 🎯 **User-Friendly**: No technical expertise required

## 📸 Screenshots

<div align="center">

![Application Preview](https://i.ibb.co/FL0sKJkK/preview.webp)

*🎨 Clean and intuitive interface designed for seamless user experience*

</div>

## 🚀 Quick Start

### Prerequisites
![Python](https://img.shields.io/badge/python-v3.7+-blue.svg)
![Platform](https://img.shields.io/badge/platform-windows%20%7C%20macOS%20%7C%20linux-lightgrey.svg)

### Installation Steps

> **💡 Tip**: Using a virtual environment is highly recommended to avoid dependency conflicts!

#### 1️⃣ Clone the Repository
```powershell
git clone https://github.com/juansilvadesign/video-to-audio.git
cd video-to-audio
```

#### 2️⃣ Set Up Virtual Environment (Recommended)
```powershell
# Install virtualenv if you haven't already
pip install virtualenv

# Create virtual environment
virtualenv .env

# Activate virtual environment
.env\Scripts\activate
```

#### 3️⃣ Install Dependencies
```powershell
pip install -r requirements.txt
```

#### 4️⃣ Launch Application
```powershell
python app.py
```

#### 5️⃣ Deactivate Environment (When Done)
```powershell
deactivate
```

### 🎯 One-Line Installation
```powershell
git clone https://github.com/juansilvadesign/video-to-audio.git && cd video-to-audio && pip install -r requirements.txt && python app.py
```

## 🛠 Creating Your Custom Run Script (Windows)

### 📝 Setting Up run.bat

For Windows users, you can create a personalized batch file to quickly launch the application without typing commands each time.

#### ✨ Quick Setup

1. **📋 Copy the Template**
   - Locate the `template.bat` file in the project folder
   - Copy its contents to create your own `run.bat`

2. **✏️ Customize the Path**
   ```batch
   @echo off
   echo Starting video-to-audio...
   REM Replace with your actual project path
   "C:\Your\Actual\Path\video-to-audio\.env\Scripts\python.exe" app.py
   pause
   ```

3. **🎯 Example Configuration**
   ```batch
   @echo off
   echo Starting video-to-audio...
   "C:\Users\YourName\Documents\video-to-audio\.env\Scripts\python.exe" app.py
   pause
   ```

#### 🚀 Usage
Once configured, simply double-click your `run.bat` file to launch the application instantly!

> **💡 Pro Tip**: Keep your `run.bat` file local and don't commit it to Git since it contains your specific folder paths.

## �📦 Dependencies

### Core Libraries
| Package | Version | Purpose | Badge |
|---------|---------|---------|-------|
| PyQt5 | Latest | GUI Framework | ![PyQt5](https://img.shields.io/pypi/v/PyQt5?label=PyQt5&color=green) |
| MoviePy | 1.0.3 | Video Processing | ![MoviePy](https://img.shields.io/pypi/v/moviepy?label=MoviePy&color=red) |

### Supporting Libraries
- **NumPy** `>=1.18.1` - Numerical computations
- **ImageIO** `>=2.5.0` - Image I/O operations
- **Pillow** `>=7.0.0` - Image processing
- **SciPy** `>=1.3.0` - Scientific computing
- **TQDM** `>=4.0.0` - Progress bars
- **PyDub** `>=0.23.0` - Audio manipulation
- **OpenCV** `>=4.5` - Computer vision

### 🔧 Manual Installation
```powershell
pip install moviepy==1.0.3 numpy>=1.18.1 imageio>=2.5.0 decorator>=4.3.0 tqdm>=4.0.0 Pillow>=7.0.0 scipy>=1.3.0 pydub>=0.23.0 audiofile>=0.0.0 opencv-python>=4.5
```

## 🎯 How to Use

### Step-by-Step Guide

<table>
<tr>
<td align="center"><strong>1️⃣</strong></td>
<td><strong>Select Videos</strong><br/>Click the "Select Videos" button to choose one or multiple video files</td>
</tr>
<tr>
<td align="center"><strong>2️⃣</strong></td>
<td><strong>Choose Format</strong><br/>Select your preferred audio format (MP3, WAV, or AAC) from the dropdown menu</td>
</tr>
<tr>
<td align="center"><strong>3️⃣</strong></td>
<td><strong>Set Bitrate</strong><br/>Choose audio quality from 64 kbps to 320 kbps based on your needs</td>
</tr>
<tr>
<td align="center"><strong>4️⃣</strong></td>
<td><strong>Output Location</strong><br/>Select the destination folder for your converted audio files</td>
</tr>
<tr>
<td align="center"><strong>5️⃣</strong></td>
<td><strong>Start Conversion</strong><br/>Click "Convert" and watch the real-time progress bar</td>
</tr>
<tr>
<td align="center"><strong>6️⃣</strong></td>
<td><strong>Enjoy!</strong><br/>Get notified when conversion is complete and enjoy your audio files</td>
</tr>
</table>

### 💡 Pro Tips
- 🎵 **Higher bitrates** = Better quality but larger file sizes
- 📁 **Batch processing** saves time when converting multiple files
- 🔄 **Progress tracking** keeps you informed during longer conversions

## 🤝 Contributing

We welcome contributions from the community! Whether you're fixing bugs, adding features, improving documentation, or sharing ideas, your help makes this project better for everyone.

**📖 Read our [Contributing Guide](CONTRIBUTING.md)** for detailed information on:

- �️ Setting up the development environment
- � Development workflow and best practices  
- � Code standards and guidelines
- 🐛 How to report issues effectively
- 💡 Submitting feature requests

### Quick Start for Contributors

1. **Fork & Clone** the repository
2. **Set up** your development environment  
3. **Create** a feature branch
4. **Make** your changes with tests
5. **Submit** a pull request

**Questions?** Feel free to [open an issue](https://github.com/juansilvadesign/video-to-audio/issues) or reach out via email!

## � Security

Security is important to us. If you discover a security vulnerability, please review our **[Security Policy](SECURITY.md)** for instructions on how to report it responsibly.

### 🛡️ Security Features
- Input validation for video files
- Safe file handling and processing
- Secure temporary file management
- Regular dependency updates

### 📋 Quick Security Guidelines
- Always use the latest version
- Only process trusted video files
- Run with minimal necessary permissions
- Keep your system updated

**🚨 For security vulnerabilities, please email [contact@juansilva.design](mailto:contact@juansilva.design) instead of creating public issues.**

## �📄 License

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

*Feel free to use, modify, and distribute this software! 🎉*

</div>

## 🙏 Acknowledgments

<table>
<tr>
<td align="center">
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="50" height="50">
<br><strong>Python</strong>
</td>
<td align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/1200px-Qt_logo_2016.svg.png" width="50" height="50">
<br><strong>PyQt5</strong>
</td>
<td align="center">
🎬
<br><strong>MoviePy</strong>
</td>
<td align="center">
🎨
<br><strong>Open Source Icons</strong>
</td>
</tr>
</table>

- **🎬 MoviePy Team** - For the powerful [video processing library](https://zulko.github.io/moviepy/)
- **🖼️ Icon Contributors** - Free and open-source icon sets that enhance the UI
- **🐍 Python Community** - For the amazing ecosystem and tools
- **💻 Open Source Community** - For inspiration and continuous learning

## 📞 Get in Touch

<div align="center">

### Let's Connect! 🌟

[![Email](https://img.shields.io/badge/Email-contact%40juansilva.design-red?style=for-the-badge&logo=gmail&logoColor=white)](mailto:contact@juansilva.design)
[![GitHub Issues](https://img.shields.io/badge/GitHub-Issues-black?style=for-the-badge&logo=github&logoColor=white)](https://github.com/juansilvadesign/video-to-audio/issues)

**📧 Email**: contact@juansilva.design  
**🐛 Issues**: [Create an issue](https://github.com/juansilvadesign/video-to-audio/issues) on GitHub  
**💬 Discussions**: Open for feature requests and feedback!

</div>

---

<div align="center">

### 🎉 Thank You for Using Video to Audio Converter!

*Made with 💜 by **Juan Silva***

**⭐ If you found this project helpful, please consider giving it a star!**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=juansilvadesign.video-to-audio)

</div>