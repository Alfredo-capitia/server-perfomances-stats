#!/bin/bash 
set -euo pipefail

echo "================================"
echo "  SERVER PERFORMANCE STATS"

CPU_IDLE=$(top -bn1 | grep -i "cpu" | head -1 | awk '{print $8}' | tr ',' '.')
CPU_USED=$(echo "100 - $CPU_IDLE" | bc)
echo ""
echo "--- CPU ---"
echo "Uso: ${CPU_USED}%"

MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/^Mem:/ {print $3}')
MEM_FREE=$(free -h | awk '/^Mem:/ {print $4}')
MEM_PCT=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2*100}')
echo ""
echo "--- MEMÓRIA ---"
echo "Total: $MEM_TOTAL | Usado: $MEM_USED | Livre: $MEM_FREE | Uso: ${MEM_PCT}%"

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PCT=$(df / | awk 'NR==2 {print $5}')
echo ""
echo "--- DISCO (/) ---"
echo "Total: $DISK_TOTAL | Usado: $DISK_USED | Livre: $DISK_FREE | Uso: $DISK_PCT"

echo ""
echo "--- TOP 5 PROCESSOS (CPU) ---"
ps aux --sort=-%cpu | awk 'NR<=6 {printf "%-12s %-6s %-5s %-5s %s\n", $1,$2,$3,$4,$11}'

echo ""
echo "--- TOP 5 PROCESSOS (MEMÓRIA) ---"
ps aux --sort=-%mem | awk 'NR<=6 {printf "%-12s %-6s %-5s %-5s %s\n", $1,$2,$3,$4,$11}'
