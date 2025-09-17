# System Health Monitor

**A beginner-friendly Bash script for Linux that monitors CPU, memory, and disk usage.**  
The script logs usage metrics with timestamps and generates warnings whenever usage exceeds configurable thresholds.

## Overview
System Health Monitor is a lightweight Bash script designed for beginners to learn Bash scripting while creating a practical tool. It tracks system resource usage, logs results to a file, and generates warnings if thresholds are exceeded.

## Features
- Monitors **CPU**, **Memory**, and **Disk** usage.
- Logs results with **timestamps** to `/var/log/system_health.log`.
- Generates **⚠️ warnings** when usage exceeds configurable thresholds.
- Fully configurable thresholds for CPU, Memory, and Disk.
- Beginner-friendly, easy to run, and ideal for learning Bash scripting.

## Prerequisites
- Linux system
- Bash shell
- `sudo` privileges (required to write logs to `/var/log`)
- Docker (optional, for containerized deployment)

## Installation & Usage

**Run the following commands to clone, setup, and run the script:**
```bash
# Clone the repository
git clone https://github.com/Tara-Choudhary/System-Health-Monitor.git

# Go into the folder
cd System-Health-Monitor

# Make the script executable
chmod +x system_health_monitor.sh

# Run the script
sudo ./system_health_monitor.sh

# View the log file
cat /var/log/system_health.log

# Or follow it live
tail -f /var/log/system_health.log
```
## Running with Docker
**You can also containerize the script using Docker:**
```bash
# Build the Docker image
docker build -t system-health-monitor .

# Run the container
docker run --rm system-health-monitor

```

## Configuration
**Edit the script to set thresholds according to your preference:**
```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=70

```

## Example Output
```bash
# Scenario 1: Usage exceeds thresholds
2025-09-16 19:19:13 - ===== System Health Check Started =====
2025-09-16 19:19:13 - CPU usage: 85%
2025-09-16 19:19:13 - ⚠️ CPU usage above 80%!
2025-09-16 19:19:13 - Memory usage: 80%
2025-09-16 19:19:13 - ⚠️ Memory usage above 75%!
2025-09-16 19:19:13 - Disk usage: 75%
2025-09-16 19:19:13 - ⚠️ Disk usage above 70%!
2025-09-16 19:19:13 - ===== Check Completed =====

# Scenario 2: Usage below thresholds
2025-09-16 19:19:13 - ===== System Health Check Started =====
2025-09-16 19:19:13 - CPU usage: 45%
2025-09-16 19:19:13 - Memory usage: 60%
2025-09-16 19:19:13 - Disk usage: 50%
2025-09-16 19:19:13 - ===== Check Completed =====
```
**Note: Warnings appear only when usage exceeds configured thresholds.**
