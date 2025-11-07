#!/bin/bash

while true
do
	sleep 1

	cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
	used_total_memory=$(free -h | awk 'NR==2 {printf "%.2f", $3*100/$2}')
	top_five_processes_cpu_usage=$(ps -eo comm,%cpu --sort=-%cpu | awk 'NR>1 {print $1}' | head -n 5 | paste -sd, -)
	top_five_processes_memory_usage=$(ps -eo comm,%mem --sort=-%mem | awk 'NR>1 {print $1}' | head -n 5 | paste -sd, -)
	separator="=============================="

	clear

	echo "$separator"
	echo "- CPU: $cpu_usage%"
	echo "- Memory: $used_total_memory%"
	echo "- Top 5 CPU processes: $top_five_processes_cpu_usage"
	echo "- Top 5 Memory processes: $top_five_processes_memory_usage"
	echo "$separator"
	./repositorio-github.sh
done
