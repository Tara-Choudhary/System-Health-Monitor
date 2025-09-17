#!/bin/bash
#
# System Health Monitor Script
# Logs CPU, Memory, and Disk usage and alerts if thresholds are exceeded.

# === CONFIGURATION ===
LOG_FILE="/var/log/system_health.log"
CPU_THRESHOLD=80       # % usage
MEM_THRESHOLD=75       # % usage
DISK_THRESHOLD=70      # % usage

# === ENSURE LOG FILE EXISTS ===
if [ ! -f "$LOG_FILE" ]; then
    # File does NOT exist → create it and set permissions
    touch "$LOG_FILE"
    chmod 644 "$LOG_FILE"
fi

# === FUNCTIONS ===
log_message() {
    # $1 = message
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

check_cpu() {
    # Get CPU usage as integer (user + system)
    local usage
    usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
    log_message "CPU usage: ${usage}%"
    if [ "$usage" -gt "$CPU_THRESHOLD" ]; then
        log_message "⚠️  CPU usage above ${CPU_THRESHOLD}%!"
    fi
}

check_memory() {
    local usage
    usage=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
    log_message "Memory usage: ${usage}%"
    if [ "$usage" -gt "$MEM_THRESHOLD" ]; then
        log_message "⚠️  Memory usage above ${MEM_THRESHOLD}%!"
    fi
}

check_disk() {
    local usage
    usage=$(df / | awk 'END{print $5}' | sed 's/%//')
    log_message "Disk usage: ${usage}%"
    if [ "$usage" -gt "$DISK_THRESHOLD" ]; then
        log_message "⚠️  Disk usage above ${DISK_THRESHOLD}%!"
    fi
}

# === MAIN ===
log_message "===== System Health Check Started ====="
check_cpu
check_memory
check_disk
log_message "===== Check Completed ====="

