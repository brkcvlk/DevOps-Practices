#!/bin/bash

# total CPU usage
cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print "CPU Load: " 100 - $1"%"}'
}
# total memory usage
memory_usage() {
    echo "Memory Usage:"
    free -m | awk '/Mem:/ {printf "Used: %dMB / Total: %dMB (%.2f%%)\n", $3, $2, $3/$2 * 100.0}'
}
# total disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $5}'
}
# top 5 processes by CPU usage
top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
}
# top 5 processes by memory usage
top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
}
# Additional stats
additional_stats() {
    echo "OS Version: $(uname -a)"
    echo "Uptime: $(uptime -p)"
    echo "Logged in Users: $(who | wc -l)"
}
main() {
    echo "Server Performance Stats"
    echo "========================"
    
    cpu_usage
    echo ""
    
    memory_usage
    echo ""
    
    disk_usage
    echo ""
    
    top_cpu_processes
    echo ""
    
    top_memory_processes
    echo ""
    
    additional_stats
}
main