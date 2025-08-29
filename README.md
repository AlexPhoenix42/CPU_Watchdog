# 🛡️ CPU Watchdog Script

A lightweight Bash script that monitors the CPU usage of a target program and automatically kills it if it exceeds a defined threshold. Ideal for testing C programs or any executable that might go rogue and consume excessive system resources.

---

## 🚀 Features

- Launches your program and monitors its CPU usage in real time
- Automatically kills the process if it exceeds a configurable CPU limit
- Prevents system lockups during testing
- Easy to configure and extend

---

## 📦 Requirements

- Bash (Linux/macOS)
- `ps` and `bc` utilities (usually pre-installed)

---

## ⚙️ Usage

1. Place your compiled program in the same directory or update the script to point to its path.
2. Make the script executable:
   ```bash
   chmod +x watchdog_launcher.sh

## Powered by github.com/AlexPhoenix42 🌈🚀
https://github.com/AlexPhoenix42
