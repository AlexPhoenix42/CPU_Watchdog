#!/bin/bash
# watchdog_launcher.sh
# A simple watchdog script to monitor CPU usage of a process and kill it if it exceeds a threshold.

# 🐾 ASCII Watchdog Greeting
# === Signature with a clickable terminal link (OSC 8) ===
echo
echo -e "\e]8;;https://github.com/AlexPhoenix42\e\\Powered by ${BLUE}github.com/AlexPhoenix42${RESET} 🌈🚀\e]8;;\e\\"
echo
cat << "EOF"
Alex Phoenix
        __
    (___()'`;
    /,    /`
    \\"--\\
  CPU Watchdog Activated 🐶
EOF

# CONFIGURATION
CPU_LIMIT=80.0      # Maximum allowed CPU usage (%)
CHECK_INTERVAL=2    # Time between checks (seconds)

# --- Launch the target program ---
echo "[Watchdog] Starting target program..."
./your_program &    # Replace 'your_program' with the actual executable
PID=$!
echo "[Watchdog] Monitoring process PID: $PID"

# --- Monitor CPU usage ---
while true; do
  CPU=$(ps -o %cpu= -p "$PID" | tail -n 1 | tr -d ' ')

  if (( $(echo "$CPU > $CPU_LIMIT" | bc -l) )); then
    echo "[Watchdog] CPU usage $CPU% exceeds limit of $CPU_LIMIT%. Killing process $PID..."
    kill -9 "$PID"
    echo "[Watchdog] Process $PID terminated."
    break
  fi

  if ! ps -p "$PID" > /dev/null; then
    echo "[Watchdog] Process $PID has exited."
    break
  fi

  sleep "$CHECK_INTERVAL"
done
